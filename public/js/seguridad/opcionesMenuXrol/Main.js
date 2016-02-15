//*********************************** ModelsSeguridad.js****************************************
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


//***********************************fin de ModelsSeguridad.js****************************************

//****************************************StoresSeguridad.js******************************************

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
            //read: 'app/controller/rol_controller.php?operacion=buscarRoles', //cualquier parametro se puede agregar cuando se manda a cargar la grid con load
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
                //read: 'app/controller/modulo_controller.php?operacion=buscarModulos', //cualquier parametro se puede agregar cuando se manda a cargar la grid con load
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
         //url: 'app/controller/modulo_controller.php?operacion=buscarModulos',
         url: 'opcionMenus/buscarModulos',
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

//*****************************************fin de StoresSeguridad.js**********************************

//****************************** DataGridPermisos.js***************************************************
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
//******************************Fin de DataGridPermisos.js***************************************************

//******************************AgregarNuevoModulo.js********************************************************

Ext.define('FrmAgregarNuevoModulo', {
    extend: 'Ext.form.Panel',
    xtype: 'form-fieldcontainer',
    //controller: 'form-fieldcontainer',
    width: 600,
    bodyPadding: 10,
    defaults: {
        anchor: '100%',
        labelWidth: 100
    },
    items: [{
        xtype: 'textfield',
        name: 'txtTextoParaMostrar',
        id: 'txtTextoParaMostrar',
        fieldLabel: 'Nombre de la nueva opción(tal como se mostrará en el menú)',
        labelAlign: 'top',
        emptyText:'ejemplo: Incluir P&oacute;liza.(los carácteres especiales van en notacion HTML (&aecute ;))',
        //vtype: 'text',
        msgTarget: 'side',
        allowBlank: false
    },{
        xtype: 'textfield',
        name: 'txtLinkDeAcceso',
        id: 'txtLinkDeAcceso',
        fieldLabel: 'Ruta de acceso (lo que irá en el href)',
        labelAlign: 'top',
        emptyText:'ejemplo: app/view/prestamos/seguros/incluirPoliza.php',
        //vtype: 'text',
        msgTarget: 'side',
        allowBlank: false,
        listeners: {
            focus: function(){
                this.setValue('app/view/prestamos/seguros/nombreArchivo.php');
                this.selectText();
            },
            blur: function(){
                //this.setValue('');
            }
        }
    },{
        xtype: 'combobox',
        name: 'cmbOpcionPadre',
        id: 'cmbOpcionPadre',
        flex:1,
        editable:false,
        forceSelection: true,
        fieldLabel: 'Menú principal al que pertenece',
        labelAlign: 'top',
        emptyText:'Seleccionar...',
        //value: 'Ninguno, (ésta es una opción padre del menú.)',
        valueField: 'idOpcion', //nombre del campo devuelto por la consulta que servira de value en el combo
        displayField: 'Modulo', //nombre del campo devuelto por la consulta que servira de texto en el combo
        store: {
            type: 'remote-modulosPadre'
        },
        // We're forcing the query to run every time by setting minChars to 0
        // (default is 4)
        minChars: 0,
        queryParam: 'q',
        queryMode: 'remote',
        selecOnFocus: true,
        listeners: {
            select: function(combo, record, index) {
                //rolSeleccionado = combo; //variable global
                console.log(Ext.getCmp("cmbOpcionPadre").getValue());
                console.log(Ext.getCmp("cmbOpcionPadre").getRawValue());
                //console.log(combo);
                //Ext.getCmp('permisosGrid').getStore().load({params: {idRol: rolSeleccionado.getValue()}, callback: function(records, operation, success) {/*do something after the load finishes*/}, scope: this });
                //Ext.getCmp('arbolPreviewMenu').getStore().load({scope: this, params:{idRol: rolSeleccionado.getValue()}});
            }
        }
    }],
    buttons: [{
            text     : 'Aceptar',
            formBind: true, // Disponible hasta que los campos esten validados
            disabled: true,
            handler: function() {
                var valorCmbOpcionPadre = Ext.getCmp("cmbOpcionPadre").getValue();
                if (valorCmbOpcionPadre != null){
                    var storeModulosGrid = Ext.getCmp('modulosGrid').getStore();
                    //console.log(Ext.getCmp("cmdOpcionPadre").getValue());    
                    var nombreModulo = storeModulosGrid.findRecord('Modulo', Ext.getCmp("txtTextoParaMostrar").getValue());
                    
                    var rutaModulo = Ext.getCmp("txtLinkDeAcceso").getValue();
                    
                    if (valorCmbOpcionPadre == 0){
                        rutaModulo = "";   
                    }
                    
                    //console.log('nombre: '+ nombreModulo);
                    //console.log('ruta: '+ rutaModulo);
                    
                    if ((nombreModulo == null)){// si no estan ya en la tabla 
                        var newModulo = new ModulosModel({idOpcion: -1, Modulo: Ext.getCmp("txtTextoParaMostrar").getValue(), LinkDeAcceso: rutaModulo, OpcionPadre: Ext.getCmp("cmbOpcionPadre").getRawValue(), idOpcionPadre: valorCmbOpcionPadre, ACTUALIZADO_POR: sessvars.sesion.codigo+'/'+sessvars.sesion.cedula});
                        console.log(newModulo);
                        storeModulosGrid.insert(storeModulosGrid.getCount(),newModulo);
                        //storeModulosGrid.insert(0,new ModulosModel());    
                        
                        storeModulosGrid.load();
                        Ext.getCmp("winAgregarNuevoModulo").close();
                        moduloSeleccionado = null;
                        Ext.getCmp('modulosGrid').getSelectionModel().deselectAll();
                    }else{
                        Ext.MessageBox.alert('Error', 'Disculpe, éste módulo ya se encuentra registrado, verifique e intente de nuevo.');
                        //Ext.getCmp("txtLinkDeAcceso").setValue('');
                        //Ext.getCmp("txtTextoParaMostrar").setValue('');
                        Ext.getCmp("winAgregarNuevoModulo").close();
                        moduloSeleccionado = null;
                        Ext.getCmp('modulosGrid').getSelectionModel().deselectAll();
                    }
                }else{
                    Ext.MessageBox.alert('Error', 'Disculpe, primero debe seleccionar una opción.');
                    Ext.getCmp("cmdOpcionPadre").focus();
                }
            }
        },{
            text     : 'Cancelar',
            handler  : function(){
                Ext.getCmp("winAgregarNuevoModulo").hide();
                moduloSeleccionado = null;
                Ext.getCmp('modulosGrid').getSelectionModel().deselectAll();
            }
        }]
});

//******************************fin de AgregarNuevoModulo.js*************************************************
//******************************DataGridModulos.js***********************************************************
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
//******************************fin de DataGridModulos.js****************************************************

//***********************************TreePreviewMenu.js******************************************************
Ext.require([
                'Ext.tree.*',
                'Ext.data.*',
                'Ext.tip.*'
             ]);

var treeStore = Ext.create('Ext.data.TreeStore', {
                    root: {expanded: true, text: "", "data": []}, // <- Inline root
                    proxy: {
                        type: 'ajax',
                        url: 'rols/obtenerMenuOpcionesPorRol?idRol='+rolUsuarioActual //variable global definida en el index.html.erb
                        //url: 'app/controller/rol_controller.php?operacion=obtenerOpcionesDeMenuPorRol&idRol=-1'
                    },/*
                    root: {
                        text: 'Menu',
                        id: 'root_node',
                        expanded: true
                    },*/
                    folderSort: false,
                    sorters: [{
                        property: 'id',
                        direction: 'ASC'
                    }]
                });


Ext.define('treePreviewMenu', {
        extend:'Ext.tree.Panel',
        alias: 'widget.treePreviewMenu',
        id : 'arbolPreviewMenu',
        emptyText:'No hay registros...',
        store: treeStore,
        region:'west',
        collapsible:true,
        width: 220,
        minSize: 100,
        maxSize: 220,
        rootVisible: false,
        //renderTo: 'westPanel',
        bodyStyle: '',
        title: 'Menú de Opciones(Preview)',
        useArrows: true,
});

/*var tree = Ext.create('Ext.tree.Panel', {
                    store: store,
                    renderTo: 'tree_el',
                    height: 246,
                    width: 250,
                    title: 'Opciones',
                    useArrows: true,
                             
                });*/
//*******************************fin de TreePreviewMenu.js***********************************************


//******************************Main.js***************************************************
Ext.define('FieldContModulosXrol', {
    extend: 'Ext.form.Panel',
    xtype: 'form-fieldcontainer',
    //controller: 'form-fieldcontainer',
    title: 'Seleccione el Rol y luego agrégue los Módulos a los que puede acceder ése Rol:',
    region: 'center',
    collapsible: false,
    margins: '5 0 0 0',
    width: '100%',
    bodyPadding: 10,
    defaults: {
        labelWidth: 100
    },
    items: [{
        xtype: 'fieldset',
        title: 'Selección de rol de usuario',
        collapsible: false,
        defaults: {
            labelWidth: 100,
            anchor: '100%',
            layout: {
                type: 'hbox',
                defaultMargins: {top: 0, right: 5, bottom: 0, left: 0}
            }
        },
        items: [{
            xtype : 'fieldcontainer',
            combineErrors: true,
            msgTarget: 'under',
            fieldLabel: 'Seleccione un rol',
            defaults: {
                hideLabel: true
            },
            items: [{
                        xtype: 'combobox',
                        id: 'cmbRoles',
                        flex:1,
                        editable:false,
                        forceSelection: true,
                        emptyText:'Seleccionar...',
                        displayField: 'Descripcion',
                        valueField: 'idRol',
                        store: {
                            type: 'remote-rol'
                        },
                        // We're forcing the query to run every time by setting minChars to 0
                        // (default is 4)
                        minChars: 0,
                        queryParam: 'q',
                        queryMode: 'remote',
                        selecOnFocus: true,
                        listeners: {
                            select: function(combo, record, index) {
                                rolSeleccionado = combo; //variable global
                                Ext.getCmp('permisosGrid').getStore().load({params: {idRol: rolSeleccionado.getValue()}, callback: function(records, operation, success) {/*do something after the load finishes*/}, scope: this });
                                Ext.getCmp('arbolPreviewMenu').getStore().load({scope: this, params:{idRol: rolSeleccionado.getValue()}});
                            }
                        }

                    }, {
                        xtype: 'fieldcontainer',
                        combineErrors: false,
                        msgTarget: 'under',
                        layout:'hbox',
                        defaults: {
                            hideLabel: true
                        },
                        items: [{
                                iconCls: null,
                                glyph: 'xf067@FontAwesome', //agregar
                                xtype: 'button',
                                handler: function(){
                                    Ext.MessageBox.prompt('Añadir Rol', 'Por favor ingrese un nombre para el nuevo Rol:<br />', function(btn, text,cfg){
                                            if(btn == 'ok') {
                                                if (Ext.isEmpty(text)){
                                                    var newMsg = '<span style="color:red">Por favor ingrese un nombre para el nuevo Rol:</br></span>';
                                                    Ext.Msg.show(Ext.apply({}, { msg: newMsg }, cfg));
                                                }else{
                                                    //console.log(btn);
                                                    var storeComboRoles = Ext.getCmp('cmbRoles').getStore();
                                                    var nombreRol = storeComboRoles.findRecord('Descripcion', text);

                                                    if (nombreRol == null){// si no estan ya en el combo
                                                        storeComboRoles.insert(storeComboRoles.getCount(),{ idRol:-1, Descripcion: text });
                                                        storeComboRoles.load(); // se recarga para que traiga el nuevo id asignado al insertarlo en la tabla
                                                    }else{
                                                        Ext.MessageBox.alert('Error', 'Disculpe, éste rol ya se encuentra registrado, verifique e intente de nuevo.');
                                                    }
                                                }
                                            }
                                    });                  
                                }
                            }, {
                                iconCls: null,
                                glyph: 'xf044@FontAwesome', //editar
                                xtype: 'button',
                                handler: function(){
                                    var rolSeleccionado = Ext.getCmp('cmbRoles').getValue();

                                    if (rolSeleccionado!=null) {
                                        Ext.MessageBox.prompt('Editar nombre de Rol', 'Por favor modifique el nombre del Rol y presione \'Aceptar\'.\n\n', function(btn, text,cfg){
                                                if(btn == 'ok') {
                                                    if (Ext.isEmpty(text)){
                                                        var newMsg = '<span style="color:red">Por favor ingrese un nombre para el nuevo Rol:</br></span>';
                                                        Ext.Msg.show(Ext.apply({}, { msg: newMsg }, cfg));
                                                    }else{
                                                        //console.log(btn);
                                                        var storeComboRoles = Ext.getCmp('cmbRoles').getStore();
                                                        var nombreRol = storeComboRoles.findRecord('Descripcion', text,0,false,true);

                                                        if (nombreRol == null){// si no estan ya en el combo
                                                            var v = Ext.getCmp('cmbRoles').getValue();
                                                            var record = Ext.getCmp('cmbRoles').findRecord('idRol', v);
                                                            record.beginEdit();
                                                            record.set('Descripcion', text);
                                                            record.endEdit();
                                                            //storeComboRoles.insert(storeComboRoles.getCount(),{ Descripcion: text });
                                                            //storeComboRoles.load(); // se recarga para que traiga el nuevo id asignado al insertarlo en la tabla
                                                        }else{
                                                            Ext.MessageBox.alert('Error', 'Disculpe, éste nombre de rol ya se encuentra registrado, verifique e intente de nuevo.');
                                                        }
                                                    }
                                                }
                                        },this,false,Ext.getCmp('cmbRoles').getRawValue());
                                    }else{
                                        Ext.MessageBox.alert('Error', 'Disculpe, primero debe seleccionar el Rol que desea modificar.', this);  
                                    }
                                }
                            }, {
                                iconCls: null,
                                glyph: 'xf00d@FontAwesome', //remover
                                xtype: 'button',
                                handler: function(){
                                    var rolSeleccionado = Ext.getCmp('cmbRoles').getValue();

                                    if (rolSeleccionado!=null) {
                                        Ext.MessageBox.confirm('Confirmar', '\u00BFSeguro que deseas quitar el Rol \''+Ext.getCmp('cmbRoles').getRawValue()+'\' ?', function (id, value) {
                                            if (id === 'yes') {
                                                console.log('respuesta confirm: '+id);
                                                var storeComboRoles = Ext.getCmp('cmbRoles').getStore();
                                                
                                              
                                                var v = Ext.getCmp('cmbRoles').getValue();
                                                var r = Ext.getCmp('cmbRoles').findRecord('idRol', v);

                                                storeComboRoles.remove(storeComboRoles.getAt(storeComboRoles.indexOf(r)));
                                                rolSeleccionado = null; //variable global
                                            }/*else{
                                                console.log('respuesta confirm: '+id);
                                            }*/
                                        }, this); 
                                        return false;
                                    }else{
                                      Ext.MessageBox.alert('Error', 'Disculpe, primero debe seleccionar el Rol que desea quitar.', this);
                                    }
                                }
                            }
                        ]
                    }
            ]
        }] 
    }, {
        xtype: 'container',
        layout: 'hbox',
        margin: '0 0 10',
        items: [{
            xtype: 'fieldset',
            flex: 1,
            title: 'Módulos a los que tiene acceso el rol seleccionado:',
            //defaultType: 'checkbox', // each item will be a checkbox
            layout: 'fit',
            
            items: [{
            xtype: 'panel',
            layout: 'fit',            
            items: [Ext.create('PermisosGrid')]
            }]
        }/*, {
            xtype: 'component',
            width: 10
        }, {
            xtype: 'fieldset',
            flex: 1,
            title: 'Módulos disponibles',
            defaultType: 'radio', // each item will be a radio button
            layout: 'anchor',
            defaults: {
                anchor: '100%',
                hideEmptyLabel: false
            },
            items: [{
                xtype: 'textfield',
                name: 'txt-test2',
                fieldLabel: 'Alignment Test'
            }, {
                checked: true,
                fieldLabel: 'Favorite Color',
                boxLabel: 'Red',
                name: 'fav-color',
                inputValue: 'red'
            }, {
                boxLabel: 'Blue',
                name: 'fav-color',
                inputValue: 'blue'
            }, {
                boxLabel: 'Green',
                name: 'fav-color',
                inputValue: 'green'
            }]
        }*/]
    }],
    buttons: [{
        text   : 'Cerrar',
        handler: function() {
            //$("#contenidos").load("cuerpo/inicio.php");
            location.reload();
        }
    }]
});

Ext.onReady(function() {
    //$("#menuL_Cerrar_Ses").mousemove();
    //$("#menuL_Cerrar_Ses").mouseover();
    //Ext.MessageBox.alert('Mensaje', "Felicitaciones!  La libreria: 5.1 esta instalada correctamente!");
   //***************************************************************************************************
    Ext.create('Ext.panel.Panel', {
        title: '<h1 style="font-family: Georgia, "Times New Roman", Times, serif;">Actualizar Derechos de Acceso por Rol de Usuario</h1></br>',
        id: 'panelPrincipal',
        height: 600,
        width: '95%',
        layout: 'border',
        //renderTo: 'marcoExtJs',
        style: {
            marginLeft: 'auto',
            marginRight: 'auto'
        },
        layout:'border',
        defaults: {
            split: false,
            bodyStyle: 'padding:15px'
        },
        items: [
            Ext.create('treePreviewMenu'),
            Ext.create('FieldContModulosXrol')
        ]
    });
   //********************************************************************************************************

   Ext.create('Ext.window.Window', {
            extend: 'Ext.form.Panel',
            title: 'Agregar permisos al rol',
            id:'winAgregarPermiso',
            modal: true,
            height: 440,
            width: 700,
            closeAction :'hide',
            layout: 'fit',
            items: [Ext.create('ModulosGrid')],
            buttons: [{
                    text     : 'Cerrar',
                    handler  : function(){
                        Ext.getCmp('winAgregarPermiso').hide();
                    }
            }]
    });


    //alert('Espere...');
    /*Ext.getCmp('fechaentrega').setValue(new Date());
    Ext.MessageBox.show({
        title: 'Mensaje',
        msg: 'La fecha de entrega es: ' + Ext.getCmp('fechaentrega').getSubmitValue(),
        width:400,
        buttons: Ext.MessageBox.OK
       });*/
});

/****************************fin de Main.js****************************************** */