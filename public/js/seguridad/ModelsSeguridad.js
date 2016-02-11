//***********************************************************************
//Modelo Permisos usado en DataGridPermisos.js

Ext.define('ModeloPermisos', {
    extend: 'Ext.data.Model',
    fields: [ 'Rol','Modulo','PuedeConsultar', 'PuedeGrabar', 'PuedeEliminar','idOpcion','idRol' ]
});

//************************************************************************
//Modelo Rol usado para listar los roles en un combo
Ext.define('Rol', {
    extend: 'Ext.data.Model',

    fields: [
        { name: 'idRol',      type: 'int' },
        { name: 'Descripcion',    type: 'string' }
    ]
});
//*************************************************************************

//*************************************************************************
//Modelo Modulos usado en DataGridModulos.js y en StoresSeguridad.js para el store del combo que lista los modulos 

Ext.define('ModulosModel', {
    extend: 'Ext.data.Model',
    fields: ['Modulo','LinkDeAcceso', 'OpcionPadre','idOpcion', 'idOpcionPadre','ACTUALIZADO_POR' ]
});

//***********************************************************************
//Modelo UsuariosXRol usado en DataGridUsuariosXRol.js

Ext.define('ModeloUsuariosXRol', {
    extend: 'Ext.data.Model',
    fields: [ 'Cedula','Nombres','Apellidos', 'Rol', 'idUsuario','NumeroSocio','idRol' ]
});
