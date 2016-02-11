//Definicion del Modelo en ModelsSeguridad.js

//Definicion del Data Store en StoresSeguridad.js

//Definicion de la clase UsuariosXRolGrid
 Ext.define('UsuariosXRolGrid', {
     extend: 'Ext.grid.Panel',
     //Definicion del alias que puede usado en un xtype
     alias: 'widget.usuariosXrolGrid',
     requires: [
        'Ext.selection.CellModel',
        'Ext.grid.*',
        'Ext.data.*',
        'Ext.util.*',
        'Ext.form.*'
     ],
     xtype: 'cell-editing',
     id : 'usuariosXrolGrid',
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
             {text: "Cédula", width: 100, dataIndex: 'Cedula', sortable: true},
             {text: "Código Socio", width: 100, dataIndex: 'NumeroSocio', sortable: true},
             {text: "Nombres", flex: 1, dataIndex: 'Nombres', sortable: true},
             {text: "Apellidos", flex: 1, dataIndex: 'Apellidos', sortable: true},
             {text: "Rol", width: 150, dataIndex: 'Rol', sortable: true}
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
                     text: 'Añadir Usuario',
                     listeners: {
                       'click' : function() {
                            if (rolSeleccionado != null){
                                Ext.getCmp('winAgregarUsuario').show();
                            }else{
                                Ext.MessageBox.alert('Error', 'Disculpe, primero debe seleccionar un Rol.');
                            }
                       }
                     }
                 },
                 {
                     xtype: 'button',
                     text: 'Quitar Usuario',
                     listeners: {
                        click : function() {
                            if (itemUsuariosXRolGridSeleccionado!=null) {
                                Ext.MessageBox.confirm('Confirmar', '\u00BFSeguro que deseas quitar el acceso al módulo \''+itemUsuariosXRolGridSeleccionado.Modulo+'\' del rol \''+itemUsuariosXRolGridSeleccionado.Rol+'\'?', function (id, value) {
                                    if (id === 'yes') {
                                        /*console.log('respuesta confirm: '+id);
                                        var rol = itemUsuariosXRolGridSeleccionado.Rol;
                                        var modulo = itemUsuariosXRolGridSeleccionado.Modulo;
                                        var idRol = itemUsuariosXRolGridSeleccionado.idRol;
                                        Ext.MessageBox.show({
                                            title: 'Mensaje',
                                            msg: 'El rol seleccionado es: ' + rol + '<br>' + 'La modulo seleccionada es: ' + modulo + '<br>' + 'El idRol seleccionado es: ' + idRol,
                                            width:400,
                                            buttons: Ext.MessageBox.OK
                                        });
                                        console.log(Ext.getCmp('usuariosXrolGrid').getSelectionModel().getCurrentPosition());*/
                                        Ext.getCmp('usuariosXrolGrid').getStore().removeAt(Ext.getCmp('usuariosXrolGrid').getSelectionModel().getCurrentPosition().rowIdx);
                                        itemUsuariosXRolGridSeleccionado = null;
                                        Ext.getCmp('usuariosXrolGrid').getSelectionModel().deselectAll();
                                    }else{
                                        //console.log('respuesta confirm: '+id);
                                        itemUsuariosXRolGridSeleccionado = null;
                                        Ext.getCmp('usuariosXrolGrid').getSelectionModel().deselectAll();
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
    this.store = Ext.create('UsuariosXRolStore');
    this.forceFit = true;
    this.scroll = false;
    this.viewConfig = { style: {overflow: 'auto', overflowX: 'hidden' } };
    this.verticalScroller = {xtype: 'paginggridscroller'};
    this.listeners = {
        load : function() {
          itemUsuariosXRolGridSeleccionado = null;
        },
        itemclick : function() {
          itemUsuariosXRolGridSeleccionado = this.getSelectionModel().selected.items[0].data;
          //console.log(itemUsuariosXRolGridSeleccionado);
        }
    };

    //Llamamos a la super clase a iniciacion del componente
    UsuariosXRolGrid.superclass.initComponent.call(this);
  }
 });