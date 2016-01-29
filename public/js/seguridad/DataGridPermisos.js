//Definicion del Modelo
 Ext.define('ModeloPermisos', {
    extend: 'Ext.data.Model',
    fields: [ 'Rol','Modulo','PuedeConsultar', 'PuedeGrabar', 'PuedeEliminar' ]
});

//Definicion del Data Store
 var permisosStore = Ext.create('Ext.data.Store', {
     model: 'ModeloPermisos',
     autoLoad: false,
     autoSync: true,
     //pageSize: itemsPerPage,
     proxy: {
               type: 'ajax',
               api: {
                read: 'app/controller/rol_controller.php?operacion=buscarPermisosPorRol', //el id del rol se envia por parametro cuando se manda a cargar la grid
                create: 'app/controller/rol_controller.php?operacion=agregarPermisoARol',
                update: 'app.php/users/update',
                destroy: 'app.php/users/destroy'
               },
               //url: 'app/controller/rol_controller.php?operacion=buscarPermisosPorRol', //el id del rol se envia por parametro cuando se manda a cargar la grid
               reader: {
                   type: 'json',
                   root: 'rows'
               },
               writer: {
                   type: 'json',
                   writeAllFields: false,
                   root: 'data'
               }
     },
     listeners: {
        write: function(proxy, operation){
            console.log(proxy);
            console.log(operation);
            if (operation.action == 'destroy') {
                main.child('#form').setActiveRecord(null);
            }
            Ext.example.msg(operation.action, operation.resultSet.message);
        }
     }
 });

 //Definicion de la clase PermisosGrid
 Ext.define('PermisosGrid', {
     extend: 'Ext.grid.Panel',
     //Definicion del alias que puede usado en un xtype
     alias: 'widget.permisosGrid',
     id : 'permisosGrid',
     emptyText:'No hay registros...',
     //Sobre escribimos este metodo de Ext.grid.Panel
     initComponent : function() {
         //Definicion de las columnas del grid
         this.columns = [
             {xtype: 'rownumberer', width: 40, dataIndex: 'id', sortable: true},
             {text: "Rol", width: 120, dataIndex: 'Rol', sortable: true},
             {text: "Módulo", flex: 1, dataIndex: 'Modulo', sortable: true},
             {text: 'Permisos de', sortable: false,
                columns: [{
                    text     : 'Lectura',
                    width    : 75,
                    dataIndex: 'PuedeConsultar',
                    sortable : true,
                    renderer :  function(val) {
                        if (val) { //si es True
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
                        if (val) { //si es True
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
                        if (val) { //si es True
                            return '<span style="color:green;">S&iacute;</span>';
                        } else {
                            return '<span style="color:red;">No</span>';
                        }
                        return val;
                    }
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
                     text: 'Agregar',
                     listeners: {
                       'click' : function() {
                            if (rolSeleccionado != null){
                                Ext.getCmp('winAgregarPermiso').show();
                            }else{
                                Ext.MessageBox.alert('Error', 'Primero debe seleccionar un Rol.');
                            }
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
                              Ext.MessageBox.alert('Error', 'No ha seleccionado un item.');
                            }                    
                        }
   
                     }
                  }]
    } ];
    // Origen de los datos, de un data store
    this.store = permisosStore;
    this.forceFit = true;
 	this.scroll = false;
 	this.viewConfig = { style: {overflow: 'auto', overflowX: 'hidden' } };
 	this.verticalScroller = {xtype: 'paginggridscroller'};
    this.listeners = {
        itemclick : function() {
          itemGridSeleccionado = this.getSelectionModel().selected.items[0].data;
          //console.log(itemGridSeleccionado);
        }
    };

    //Llamamos a la super clase a iniciacion del componente
    PermisosGrid.superclass.initComponent.call(this);
  }
 });