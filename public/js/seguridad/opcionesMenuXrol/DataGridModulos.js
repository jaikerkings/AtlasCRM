//Definicion del Modelo en modelsSeguridad.js

//*************************************************************************************************************************

/*Ext.define('ModulosStore', {
    extend: 'Ext.data.Store',
    model: 'ModulosModel',
    autoLoad: true,
    autoSync: true,
    //pageSize: itemsPerPage,
    proxy: {
            type: 'ajax',
            url: 'app/controller/modulo_controller.php?operacion=buscarModulos', //el id del rol se envia por parametro cuando se manda a cargar(load()) la grid permisosGrid
            reader: {
                type: 'json',
                root: 'rows'
            }
        }
});*/

//*************************************************************************************************************************
//definimos la ventana para especificar permisos sobre el modulo seleccionado
Ext.define('EspecificarPermisosWindow', {
            extend: 'Ext.window.Window',
            xtype: 'form-fieldcontainer',
            id:'winEspecificarPermisos',
            height: 130,
            width: 400,
            title: 'Especificar Permisos Sobre el Modulo Seleccionado',
            scrollable: true,
            layout: 'fit',
            constrain: true,
            //bodyPadding: 10,
            items: [Ext.create('Ext.form.Panel', {
                    xtype: 'form-fieldcontainer',
                    layout: 'fit',
                    items:[{
                        xtype: 'fieldset',
                        flex: 1,
                        height: 5,
                        title: 'Agregar éste Módulo con permisos de:',
                        //defaultType: 'checkbox', // each item will be a checkbox
                        layout: 'anchor',
                        margin : '10 0 5 0', //arriba,izquierda, abajo, derecha
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
                        },{
                            xtype: 'toolbar',
                            dock: 'bottom',
                            ui: 'footer',
                            margin : '5 0 0 0', //arriba,izquierda, abajo, derecha
                            layout: {
                                pack: 'center'
                            },
                            items: [{
                                    xtype: 'button',
                                    text: 'Aceptar',
                                    listeners: {
                                        'click' : function() {
                                            var lectura = Ext.getCmp('btnLectura').pressed;
                                            var escritura = Ext.getCmp('btnEscritura').pressed;
                                            var eliminacion = Ext.getCmp('btnEliminacion').pressed;
                                            var storePermisosGrid = Ext.getCmp('permisosGrid').getStore();

                                            //console.log(rolSeleccionado);  //variable global definida en actualizarOpcionesMenu.php
                                            //console.log(moduloSeleccionado); //variable global definida en actualizarOpcionesMenu.php
                                            if (moduloSeleccionado.idOpcionPadre != 0){
                                                //console.log('NO ES OPCION PADRE');
                                                //console.log('hay que verificar si la opcion padre ya esta incluida..');
                                                var opcionPadre = storePermisosGrid.findExact('idOpcion', moduloSeleccionado.idOpcionPadre.toString());
                                                //console.log(opcionPadre);
                                                if (opcionPadre != -1){//si el padre ya esta incluido, se incluye de una vez la opcion seleccionada

                                                    storePermisosGrid.insert(0,new ModeloPermisos({Rol: rolSeleccionado.getRawValue(), Modulo: moduloSeleccionado.Modulo, PuedeConsultar: lectura, PuedeGrabar: escritura, PuedeEliminar: eliminacion, idRol: rolSeleccionado.getValue(), idOpcion: moduloSeleccionado.idOpcion}));
                                                }else{//si no esta incluida la opcion padre de la opcion seleccionada, hay que incluirla primero

                                                    var storeModulosGrid = Ext.getCmp('modulosGrid').getStore();
                                                    var opcPadre = storeModulosGrid.findRecord('idOpcion',moduloSeleccionado.idOpcionPadre.toString(),0,false,false,true);

                                                    //incluimos la opcion padre
                                                    storePermisosGrid.insert(0,new ModeloPermisos({Rol: rolSeleccionado.getRawValue(), Modulo: opcPadre.get('Modulo'), PuedeConsultar: 1, PuedeGrabar: 1, PuedeEliminar: 1, idRol: rolSeleccionado.getValue(), idOpcion: opcPadre.get('idOpcion')}));

                                                    //incluimos la opcion seleccionada
                                                    storePermisosGrid.insert(0,new ModeloPermisos({Rol: rolSeleccionado.getRawValue(), Modulo: moduloSeleccionado.Modulo, PuedeConsultar: lectura, PuedeGrabar: escritura, PuedeEliminar: eliminacion, idRol: rolSeleccionado.getValue(), idOpcion: moduloSeleccionado.idOpcion}));
                                                    //console.log(storeModulosGrid.findRecord('idOpcion',moduloSeleccionado.idOpcionPadre.toString(),0,false,false,true).get('Modulo'));
                                                }
                                            }else{//si es una opcion padre, se puede incluir d euna vez
                                                //console.log('ES OPCION PADRE');
                                                storePermisosGrid.insert(0,new ModeloPermisos({Rol: rolSeleccionado.getRawValue(), Modulo: moduloSeleccionado.Modulo, PuedeConsultar: lectura, PuedeGrabar: escritura, PuedeEliminar: eliminacion, idRol: rolSeleccionado.getValue(), idOpcion: moduloSeleccionado.idOpcion}));
                                            }

                                            Ext.getCmp('arbolPreviewMenu').getStore().load({scope: this, params:{idRol: rolSeleccionado.getValue()}});
                                            Ext.getCmp('permisosGrid').getStore().load({scope: this, params: {idRol: rolSeleccionado.getValue()} });
                                            Ext.getCmp('winEspecificarPermisos').hide();
                                            Ext.getCmp('winAgregarPermiso').hide();
                                            moduloSeleccionado = null;
                                            Ext.getCmp('modulosGrid').getSelectionModel().deselectAll();
                                        }
                                    }
                                },
                                {
                                    xtype: 'button',
                                    text: 'Cancelar',
                                    listeners: {
                                        'click' : function() {
                                            //console.log("hola2");
                                            Ext.getCmp('winEspecificarPermisos').hide();
                                        }
                                    }
                                }
                            ]
                        }]
                    }]
                })

            //*
            ]
});
//************************************************prueba******************************************************************



//*************************************************************************************************************************
Ext.define('ModulosGrid', {
    extend: 'Ext.grid.Panel',
    requires: [
        'Ext.selection.CellModel',
        'Ext.grid.*',
        'Ext.data.*',
        'Ext.util.*',
        'Ext.form.*'
    ],
    xtype: 'row-editing',
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.modulosGrid',
    id : 'modulosGrid',
    emptyText:'No hay modulos disponibles...',
    title:'<h4 style="color:red;">Haga doble click sobre un módulo para editarlo, o presione el boton \'Añadir al Rol\' para agregarlo a </br>la lista del Rol seleccionado:</h4>',
    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
         this.rowEditing = new Ext.grid.plugin.RowEditing({
            clicksToEdit: 2
         });

         Ext.apply(this, {
            plugins: [this.rowEditing]
         });
         //Definicion de las columnas del grid
         this.columns = [
             {xtype: 'rownumberer', width: 25, dataIndex: 'id', sortable: true},
             {text: "Módulo", width: 150, dataIndex: 'Modulo', sortable: true, editor: {allowBlank: false}},
             {text: "Link De Acceso", flex: 3, dataIndex: 'LinkDeAcceso', sortable: true, editor: {allowBlank: true}},
             {text: "Menu Superior", width: 150, dataIndex: 'OpcionPadre', sortable: true,
                editor: new Ext.form.field.ComboBox({
                    typeAhead: true,
                    triggerAction: 'all',
                    valueField: 'idOpcion',
                    displayField: 'Modulo',
                    allowBlank : false,
                    store: Ext.create('ModulosPadreRemoteStore')
                })
             },
             {
                xtype: 'widgetcolumn',
                width: 90,
                widget: {
                    xtype: 'button',
                    text: 'Añadir al Rol',
                    handler: function(button){
                        moduloSeleccionado = button.getWidgetRecord().data;
                        var busqueda = Ext.getCmp('permisosGrid').getStore().findRecord('idOpcion', moduloSeleccionado.idOpcion);

                        if (busqueda == null){ //si no existe en la tabla de permisos...
                            Ext.create('EspecificarPermisosWindow').show();
                        }else{
                            Ext.MessageBox.alert('Error', 'Disculpe, el Rol seleccionado ya tiene permisos registrados para este Módulo, seleccione uno distinto.', this);
                            moduloSeleccionado = null;
                            Ext.getCmp('modulosGrid').getSelectionModel().deselectAll();
                        }
                    }
                }
             }
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
                     text: 'Agregar un Modulo a la Tabla',
                     listeners: {
                       'click' : function() {
                            var win = new Ext.Window({
                                id          :'winAgregarNuevoModulo',
                                title       : 'Agregar nuevo módulo',
                                layout      : 'fit',
                                modal       :true,
                                width       : 500,
                                height      : 240,
                                closeAction :'destroy',
                                plain       : true,
                                stateful    : false,
                                items: [Ext.create('FrmAgregarNuevoModulo')]
                                
                            });
                            win.show();  
                       }
                     }
                 },
                  {
                     xtype: 'button',
                     text: 'Quitar Modulo de la Tabla',
                     listeners: {
                        click : function() {
                            if (moduloSeleccionado!=null) {
                                Ext.MessageBox.confirm('Confirmar', '\u00BFSeguro que deseas quitar el módulo \''+moduloSeleccionado.Modulo+'\' ?', function (id, value) {
                                    if (id === 'yes') {
                                        /*console.log('respuesta confirm: '+id);
                                        var modulo = moduloSeleccionado.Modulo;
                                        var link = moduloSeleccionado.LinkDeAcceso;
                                        Ext.MessageBox.show({
                                            title: 'Mensaje',
                                            msg: 'El modulo seleccionado es: ' + modulo + '<br>' + 'el link seleccionado es: ' + link,
                                            width:400,
                                            buttons: Ext.MessageBox.OK
                                        });
                                        console.log(Ext.getCmp('modulosGrid').getSelectionModel().getCurrentPosition());*/
                                        Ext.getCmp('modulosGrid').getStore().removeAt(Ext.getCmp('modulosGrid').getSelectionModel().getCurrentPosition().rowIdx);
                                        Ext.getCmp('modulosGrid').getStore().load();
                                        moduloSeleccionado = null;
                                        Ext.getCmp('modulosGrid').getSelectionModel().deselectAll();
                                    }else{
                                        //console.log('respuesta confirm: '+id);
                                        moduloSeleccionado = null;
                                        Ext.getCmp('modulosGrid').getSelectionModel().deselectAll();
                                    }
                                }, this); 
                                return false;
                            }else{
                              Ext.MessageBox.alert('Error', 'Disculpe, primero debe seleccionar el módulo que desea quitar.', this);
                            }                    
                        }
   
                     }
                  }
                  ]
    } ];
    // Origen de los datos, de un data store
    this.store = Ext.create('ModulosStore');
    this.forceFit = true;
    //this.scroll = false;
    //this.viewConfig = { enableRowBody: true, style: {overflow: 'auto', overflowX: 'hidden' } };
    //this.verticalScroller = {xtype: 'paginggridscroller'};
    this.listeners = {
        itemclick : function() {
          moduloSeleccionado = this.getSelectionModel().selected.items[0].data;
          //console.log(moduloSeleccionado);
        },
        load : function() {
          moduloSeleccionado = null;
        },
        edit : function(editor, e) {
            Ext.getCmp('modulosGrid').getStore().load();
        }
    };

    //Llamamos a la super clase a iniciacion del componente
    ModulosGrid.superclass.initComponent.call(this);
    //ModulosGrid.on('edit', function(editor, e) {
        // commit the changes right after editing finished
    //    e.record.commit();
    //};
  }
});