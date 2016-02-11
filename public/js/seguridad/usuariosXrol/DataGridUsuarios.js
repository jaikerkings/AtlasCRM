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
Ext.define('UsuariosGrid', {
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
    alias: 'widget.usuariosGrid',
    id : 'usuariosGrid',
    emptyText:'No hay usuarios registrados...',
    title:'<h4 style="color:red;">Haga doble click sobre un usuario para editarlo, o presione el boton \'Añadir al Rol\' para agregarlo a </br>la lista de usuarios del Rol seleccionado:</h4>',
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
                    store: Ext.create('UsuariosPadreRemoteStore')
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
                            Ext.getCmp('usuariosGrid').getSelectionModel().deselectAll();
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
                                        console.log(Ext.getCmp('usuariosGrid').getSelectionModel().getCurrentPosition());*/
                                        Ext.getCmp('usuariosGrid').getStore().removeAt(Ext.getCmp('usuariosGrid').getSelectionModel().getCurrentPosition().rowIdx);
                                        Ext.getCmp('usuariosGrid').getStore().load();
                                        moduloSeleccionado = null;
                                        Ext.getCmp('usuariosGrid').getSelectionModel().deselectAll();
                                    }else{
                                        //console.log('respuesta confirm: '+id);
                                        moduloSeleccionado = null;
                                        Ext.getCmp('usuariosGrid').getSelectionModel().deselectAll();
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
    this.store = Ext.create('UsuariosStore');
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
            Ext.getCmp('usuariosGrid').getStore().load();
        }
    };

    //Llamamos a la super clase a iniciacion del componente
    UsuariosGrid.superclass.initComponent.call(this);
    //ModulosGrid.on('edit', function(editor, e) {
        // commit the changes right after editing finished
    //    e.record.commit();
    //};
  }
});