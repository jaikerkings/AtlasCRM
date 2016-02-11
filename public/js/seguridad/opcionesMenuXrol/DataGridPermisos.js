//Definicion del Modelo en ModelsSeguridad.js

//Definicion del Data Store en StoresSeguridad.js

//Definicion de la clase PermisosGrid
 Ext.define('PermisosGrid', {
     extend: 'Ext.grid.Panel',
     //Definicion del alias que puede usado en un xtype
     alias: 'widget.permisosGrid',
     requires: [
        'Ext.selection.CellModel',
        'Ext.grid.*',
        'Ext.data.*',
        'Ext.util.*',
        'Ext.form.*'
     ],
     xtype: 'cell-editing',
     id : 'permisosGrid',
     emptyText:'No hay registros...',
     //Sobre escribimos este metodo de Ext.grid.Panel
     initComponent : function() {
         this.cellEditing = new Ext.grid.plugin.CellEditing({
            clicksToEdit: 2
         });

         Ext.apply(this, {
            plugins: [this.cellEditing]
         });
         //Definicion de las columnas del grid
         this.columns = [
             {xtype: 'rownumberer', width: 20, dataIndex: 'id', sortable: true},
             {text: "Módulo", flex: 1, dataIndex: 'Modulo', sortable: true},
             {text: "Rol", width: 150, dataIndex: 'Rol', sortable: true},
             {text: 'Permisos de', sortable: false,
                columns: [{
                    text     : 'Lectura',
                    width    : 75,
                    dataIndex: 'PuedeConsultar',
                    sortable : true,
                    renderer :  function(val) {
                        if (val == 1) { //si es True
                            return '<span style="color:green;">S&iacute;</span>';
                        } else {
                            return '<span style="color:red;">No</span>';
                        }
                        return val;
                    }
                }, {
                    text     : 'Escritura',
                    width    : 75,
                    dataIndex: 'PuedeGrabar',
                    sortable : true,
                    renderer :  function(val) {
                        if (val == 1) { //si es True
                            return '<span style="color:green;">S&iacute;</span>';
                        } else {
                            return '<span style="color:red;">No</span>';
                        }
                        return val;
                    }
                }, {
                    text     : 'Destrucción',
                    width    : 75,
                    dataIndex: 'PuedeEliminar',
                    sortable : true,
                    renderer :  function(val) {
                        if (val == 1) { //si es True
                            return '<span style="color:green;">S&iacute;</span>';
                        } else {
                            return '<span style="color:red;">No</span>';
                        }
                        return val;
                    },
                    editor: new Ext.form.field.ComboBox({
                        typeAhead: true,
                        triggerAction: 'all',
                        store: [
                            [1,'Sí'],
                            [0,'No']
                        ]
                    })
                }]
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
                     text: 'Agregar Permiso',
                     listeners: {
                       'click' : function() {
                            if (rolSeleccionado != null){
                                Ext.getCmp('winAgregarPermiso').show();
                            }else{
                                Ext.MessageBox.alert('Error', 'Disculpe, primero debe seleccionar un Rol.');
                            }
                       }
                     }
                 },
                 {
                     xtype: 'button',
                     text: 'Quitar',
                     listeners: {
                        click : function() {
                            if (itemPermisosGridSeleccionado!=null) {
                                Ext.MessageBox.confirm('Confirmar', '\u00BFSeguro que deseas quitar el acceso al módulo \''+itemPermisosGridSeleccionado.Modulo+'\' del rol \''+itemPermisosGridSeleccionado.Rol+'\'?', function (id, value) {
                                    if (id === 'yes') {
                                        /*console.log('respuesta confirm: '+id);
                                        var rol = itemPermisosGridSeleccionado.Rol;
                                        var modulo = itemPermisosGridSeleccionado.Modulo;
                                        var idRol = itemPermisosGridSeleccionado.idRol;
                                        Ext.MessageBox.show({
                                            title: 'Mensaje',
                                            msg: 'El rol seleccionado es: ' + rol + '<br>' + 'La modulo seleccionada es: ' + modulo + '<br>' + 'El idRol seleccionado es: ' + idRol,
                                            width:400,
                                            buttons: Ext.MessageBox.OK
                                        });
                                        console.log(Ext.getCmp('permisosGrid').getSelectionModel().getCurrentPosition());*/
                                        Ext.getCmp('permisosGrid').getStore().removeAt(Ext.getCmp('permisosGrid').getSelectionModel().getCurrentPosition().rowIdx);
                                        itemPermisosGridSeleccionado = null;
                                        Ext.getCmp('permisosGrid').getSelectionModel().deselectAll();
                                    }else{
                                        //console.log('respuesta confirm: '+id);
                                        itemPermisosGridSeleccionado = null;
                                        Ext.getCmp('permisosGrid').getSelectionModel().deselectAll();
                                    }
                                }, this); 
                                return false;
                            }else{
                              Ext.MessageBox.alert('Error', 'Disculpe, primero debe seleccionar el modulo que desea quitar.');
                            }                    
                        }
   
                     }
                  }]
    } ];
    // Origen de los datos, de un data store
    this.store = Ext.create('PermisosStore');
    this.forceFit = true;
 	this.scroll = false;
 	this.viewConfig = { style: {overflow: 'auto', overflowX: 'hidden' } };
 	this.verticalScroller = {xtype: 'paginggridscroller'};
    this.listeners = {
        load : function() {
          itemPermisosGridSeleccionado = null;
        },
        itemclick : function() {
          itemPermisosGridSeleccionado = this.getSelectionModel().selected.items[0].data;
          //console.log(itemPermisosGridSeleccionado);
        }
    };

    //Llamamos a la super clase a iniciacion del componente
    PermisosGrid.superclass.initComponent.call(this);
  }
 });