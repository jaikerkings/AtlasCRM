Ext.define('RolRemoteStore', {
    extend: 'Ext.data.Store',
    alias: 'store.remote-rol',
    model: 'Rol',
    
    storeId: 'remote-rol',

    proxy: {
         type: 'ajax',
         url: 'app/controller/rol_controller.php?operacion=buscarRoles',
         reader: {
             type: 'json'/*,
             rootProperty: 'roles'*/
         }
     },
    autoLoad: true
});