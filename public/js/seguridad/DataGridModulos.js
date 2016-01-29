//Definicion del Modelo
 Ext.define('ModulosModel', {
    extend: 'Ext.data.Model',
    fields: ['Modulo','LinkDeAcceso', 'idOpcion', 'idOpcionPadre' ]
});
//*************************************************************************************************************************

Ext.define('ModulosStore', {
    extend: 'Ext.data.Store',
    model: 'ModulosModel',
    autoLoad: true,
    autoSync: true,
    //pageSize: itemsPerPage,
    proxy: {
            type: 'ajax',
            url: 'app/controller/modulo_controller.php?operacion=buscarModulos', //el id del rol se envia por parametro cuando se manda a cargar la grid
            reader: {
                type: 'json',
                root: 'rows'
            }
        }
});

//*************************************************************************************************************************
//definimos la ventana para especificar permisos sobre el modulo seleccionado
Ext.define('EspecificarPermisosWindow', {
            extend: 'Ext.window.Window',
            xtype: 'basic-window',
            id:'winEspecificarPermisos',
            height: 150,
            width: 400,
            title: 'Especificar Permisos Sobre el Modulo Seleccionado',
            scrollable: true,
            constrain: true,
            bodyPadding: 10,
            items: [Ext.create('Ext.panel.Panel', {
                    xtype: 'form-fieldcontainer',
                    layout: 'fit',
                    items:[{
                        xtype: 'fieldset',
                        flex: 1,
                        height: 50,
                        title: 'Agregar éste Módulo con permisos de:',
                        //defaultType: 'checkbox', // each item will be a checkbox
                        layout: 'anchor',
                        defaults: {
                            anchor: '100%',
                            hideEmptyLabel: false
                        },
                        items: [{
                            xtype: 'segmentedbutton',
                            allowMultiple: true,
                            pressedButtons: [0, 2],
                            items: [{
                                text: 'Lectura',
                                id: 'btnLectura'
                            }, {
                                text: 'Escritura',
                                id: 'btnEscritura'
                            }, {
                                text: 'Destrucción',
                                id: 'btnEliminacion'
                            }]
                        }]
                    }],
                    dockedItems: [{
                        xtype: 'toolbar',
                        dock: 'bottom',
                        ui: 'footer',
                        layout: {
                            pack: 'center'
                        },
                        items: [
                            {
                                xtype: 'button',
                                text: 'Aceptar',
                                listeners: {
                                    'click' : function() {
                                        var lectura = Ext.getCmp('btnLectura').pressed;
                                        var escritura = Ext.getCmp('btnEscritura').pressed;
                                        var eliminacion = Ext.getCmp('btnEliminacion').pressed;

                                        console.log(rolSeleccionado);
                                        console.log(moduloSeleccionado);

                                        Ext.getCmp('permisosGrid').getStore().insert(0,new ModeloPermisos({Rol: rolSeleccionado.getRawValue(), Modulo: moduloSeleccionado.Modulo, PuedeConsultar: lectura, PuedeGrabar: escritura, PuedeEliminar: eliminacion, idRol: rolSeleccionado.getValue(), idOpcion: moduloSeleccionado.idOpcion}));

                                        console.log("-->"+ Ext.getCmp('btnLectura').pressed);
                                    }
                                }
                            },
                            {
                                xtype: 'button',
                                text: 'Cancelar',
                                listeners: {
                                    'click' : function() {
                                        console.log("hola2");
                                        Ext.getCmp('winEspecificarPermisos').hide();
                                    }
                                }
                            }
                        ]
                    }]
                })

            //*
            ]
});
//*************************************************************************************************************************
Ext.define('ModulosGrid', {
    extend: 'Ext.grid.Panel',
     //Definicion del alias que puede usado en un xtype
     alias: 'widget.modulosGrid',
     id : 'modulosGrid',
     emptyText:'No hay modulos disponibles...',
     title:'Haga doble click sobre un módulo para agregarlo a la lista del Rol seleccionado:',
     //Sobre escribimos este metodo de Ext.grid.Panel
     initComponent : function() {
         //Definicion de las columnas del grid
         this.columns = [
             {xtype: 'rownumberer', width: 25, dataIndex: 'id', sortable: true},
             {text: "Módulo", flex: 1, dataIndex: 'Modulo', sortable: true},
             {text: "Link De Acceso", flex: 2, dataIndex: 'LinkDeAcceso', sortable: true}
         ];
         this.dockedItems = [ {
            xtype: 'toolbar',
            dock: 'bottom',
            ui: 'footer',
            layout: {
                pack: 'center'
            },
            items: [
                    { xtype: 'button',
                     text: 'Agregar',
                     listeners: {
                       'click' : function() {
                            Ext.getCmp('winAgregarPermiso').show();
                       }
                     }
                 },
                 {
                     xtype: 'button',
                     text: 'Quitar',
                     listeners: {
                        click : function() {
                            if (itemGridSeleccionado!=null) {
                                var r = Ext.MessageBox.confirm('Confirmar', 'Are you sure you want to do that?');
                                console.log(r);
                                var usuario = itemGridSeleccionado.Rol;
                                var clave = itemGridSeleccionado.Modulo;
                                var nivel = itemGridSeleccionado.idRol;
                                Ext.MessageBox.show({
                                  title: 'Mensaje',
                                  msg: 'El usuario seleccionado es: ' + usuario + '<br>' + 'La clave seleccionada es: ' + clave + '<br>' + 'El nivel seleccionado es: ' + nivel,
                                  width:400,
                                  buttons: Ext.MessageBox.OK
                                });
                                
                            }else{
                              Ext.MessageBox.alert('Error', 'No ha seleccionado un item.', this.showToast(Ext.String.format('You clicked the {0} button', this)), this);
                            }                    
                        }
   
                     }
                  }]
    } ];
    // Origen de los datos, de un data store
    this.store = Ext.create('ModulosStore');
    this.forceFit = true;
    this.scroll = false;
    this.viewConfig = { style: {overflow: 'auto', overflowX: 'hidden' } };
    this.verticalScroller = {xtype: 'paginggridscroller'};
    this.listeners = {
        itemdblclick : function() {
          moduloSeleccionado = this.getSelectionModel().selected.items[0].data;
          Ext.create('EspecificarPermisosWindow').show();
          //console.log(moduloSeleccionado);
        }
    };

    //Llamamos a la super clase a iniciacion del componente
    ModulosGrid.superclass.initComponent.call(this);
  }
});