//**********************************************************************************************
//Store usado en DataGridPermisos

Ext.define('PermisosStore', {
    extend: 'Ext.data.Store',
     model: 'ModeloPermisos',
     autoLoad: false,
     autoSync: true,
     //pageSize: itemsPerPage,
     proxy: {
               type: 'ajax',
               api: {
                read: 'app/controller/rol_controller.php?operacion=buscarPermisosPorRol', //el id del rol se envia por parametro cuando se manda a cargar la grid
                create: 'app/controller/rol_controller.php?operacion=agregarPermisoARol',
                //update: 'app.php/users/update',
                destroy: 'app/controller/rol_controller.php?operacion=quitarPermisoARol'
               },
               reader: {
                   type: 'json',
                   root: 'rows'
               },
               writer: {
                type             : 'json',
                writeAllFields    : true,
                allowSingle         : false,
                encode             : false
               }
     },
     listeners: {
        write: function(proxy, operation){
            //console.log(proxy);
            //console.log(operation);
            if (operation.action == 'destroy') {
                console.log(operation.action+' complete!...');
            }
            if (operation.action == 'create') {
                console.log(operation.action+' complete!...');
            }
            if (operation.action == 'update') {
                console.log(operation.action+' complete!...');
            }
            //Ext.MessageBox.alert(operation.action, operation.getResultSet().getMessage());
        }
     }
 });
//***********************************************************************************************

//***********************************************************************************************
//Store usado para el combo que lista los roles
Ext.define('RolRemoteStore', {
    extend: 'Ext.data.Store',
    alias: 'store.remote-rol',
    model: 'Rol',
    storeId: 'remote-rol',
    autoLoad: true,
    autoSync: true,
    proxy: {
        type: 'ajax',
        api: {
            read: 'app/controller/rol_controller.php?operacion=buscarRoles', //cualquier parametro se puede agregar cuando se manda a cargar la grid con load
            create: 'app/controller/rol_controller.php?operacion=agregarRol',
            update: 'app/controller/rol_controller.php?operacion=actualizarRol',
            destroy: 'app/controller/rol_controller.php?operacion=quitarRol'
        },
        reader: {
            type: 'json'
        },
        writer: {
            type             : 'json',
            writeAllFields    : true,
            allowSingle         : false,
            encode             : false
        }
     }
});
//***********************************************************************************************

//**********************************************************************************************
//Store usado en DataGridModulos
Ext.define('ModulosStore', {
    extend: 'Ext.data.Store',
    model: 'ModulosModel',
    autoLoad: true,
    autoSync: true,
    proxy: {
               type: 'ajax',
               api: {
                read: 'app/controller/modulo_controller.php?operacion=buscarModulos', //cualquier parametro se puede agregar cuando se manda a cargar la grid con load
                create: 'app/controller/modulo_controller.php?operacion=agregarModulo',
                update: 'app/controller/modulo_controller.php?operacion=actualizarModulo',
                destroy: 'app/controller/modulo_controller.php?operacion=quitarModulo'
               },
               reader: {
                   type: 'json',
                   root: 'rows'
               },
               writer: {
                type             : 'json',
                writeAllFields    : true,
                allowSingle         : false,
                encode             : false
               }
    },
    listeners: {
        write: function(proxy, operation){
            //console.log(proxy);
            //console.log(operation);
            if (operation.action == 'destroy') {
                console.log(operation.action+' complete!...');
            }
            if (operation.action == 'create') {
                console.log(operation.action+' complete!...');
            }
            if (operation.action == 'update') {
                console.log(operation.action+' complete!...');
            }
            //Ext.MessageBox.alert(operation.action, operation.getResultSet().getMessage());
        },
        update: function(record, operation){
            //ocurre despues de que se actualiza el registro y antes de que se ejecute el write
            operation.data.idOpcionPadre = operation.data.OpcionPadre;
        }
    }
});
//***********************************************************************************************

//***********************************************************************************************
//Store usado para el combo usado para seleccionar el Menú padre al que pertenece una nueva opcion del menu
Ext.define('ModulosPadreRemoteStore', {
    extend: 'Ext.data.Store',
    alias: 'store.remote-modulosPadre',
    model: 'ModulosModel',
    storeId: 'remote-modulosPadre',
    proxy: {
         type: 'ajax',
         url: 'app/controller/modulo_controller.php?operacion=buscarModulos',
         reader: {
             type: 'json'/*,
             rootProperty: 'roles'*/
         }
     },
    autoLoad: true,
    listeners: {
        load: function(store){
            var rec = { idOpcion: '0', Modulo: 'Ninguno, (ésta es una opción padre del menú.)' };
            store.insert(0,rec);    
        }
    }
});

//**********************************************************************************************
//Store usado en DataGridUsuariosXRol

Ext.define('UsuariosXRolStore', {
    extend: 'Ext.data.Store',
     model: 'ModeloUsuariosXRol',
     autoLoad: false,
     autoSync: true,
     //pageSize: itemsPerPage,
     proxy: {
               type: 'ajax',
               api: {
                read: 'app/controller/rol_controller.php?operacion=buscarUsuariosPorRol', //el id del rol se envia por parametro cuando se manda a cargar la grid
                create: 'app/controller/rol_controller.php?operacion=agregarUsuarioXRol',
                //update: 'app/controller/rol_controller.php?operacion=actualizarUsuarioXRol',
                destroy: 'app/controller/rol_controller.php?operacion=quitarUsuarioARol'
               },
               reader: {
                   type: 'json',
                   root: 'rows'
               },
               writer: {
                type             : 'json',
                writeAllFields    : true,
                allowSingle         : false,
                encode             : false
               }
     },
     listeners: {
        write: function(proxy, operation){
            //console.log(proxy);
            //console.log(operation);
            if (operation.action == 'destroy') {
                console.log(operation.action+' complete!...');
            }
            if (operation.action == 'create') {
                console.log(operation.action+' complete!...');
            }
            if (operation.action == 'update') {
                console.log(operation.action+' complete!...');
            }
            //Ext.MessageBox.alert(operation.action, operation.getResultSet().getMessage());
        }
     }
 });