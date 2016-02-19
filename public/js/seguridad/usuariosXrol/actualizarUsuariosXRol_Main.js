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
    fields: ['Modulo','LinkDeAcceso', 'OpcionPadre','idOpcion', 'idOpcionPadre','updated_at' ]
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
                read: 'rols/buscarPermisosPorRol', //el id del rol se envia por parametro cuando se manda a cargar la grid
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
            read: 'rols/buscarRoles', //cualquier parametro se puede agregar cuando se manda a cargar la grid con load
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
                read: 'opcionMenus/buscarModulos', //cualquier parametro se puede agregar cuando se manda a cargar la grid con load
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
                read: 'rols/buscarUsuariosPorRol', //el id del rol se envia por parametro cuando se manda a cargar la grid
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

//*****************************************DataGridUsuariosXRol.js************************************
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
//*****************************************DataGridUsuariosXRol.js************************************
 
//******************************************actualizarUsuariosXRol_Main.js****************************
Ext.define('FieldContUsuariosXrol', {
    extend: 'Ext.form.Panel',
    xtype: 'form-fieldcontainer',
    //controller: 'form-fieldcontainer',
    title: 'Seleccione el Rol y luego agrégue los usuarios que pertenecen a ése Rol:',
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
                                Ext.getCmp('usuariosXrolGrid').getStore().load({params: {idRol: rolSeleccionado.getValue()}, callback: function(records, operation, success) {/*do something after the load finishes*/}, scope: this });
                                //Ext.getCmp('arbolPreviewMenu').getStore().load({scope: this, params:{idRol: rolSeleccionado.getValue()}});
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
            title: 'Usuarios que pertenecen al rol seleccionado:',
            layout: 'fit',
            
            items: [{
            xtype: 'panel',
            layout: 'fit',            
            items: [Ext.create('UsuariosXRolGrid')]
            }]
        }]
    }],
    buttons: [{
        text   : 'Cerrar',
        handler: function() {
            //$("#contenidos").load("cuerpo/inicio.php");
            location.reload();
        }
    }]
});

//****************************************formulario para agregar usuarios al rol*********************************
Ext.define('winAgregarUsuario_Controller', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.winAgregarUsuario_Controller',
    requires: [
        'ModeloUsuariosXRol'
    ],

    onTxtCedulaSpecialKey: function(field, e){
        if (e.getKey() == e.ENTER) {
            field.blur();
            return false;
        }
    },

    onTxtCedulaBlur: function(textField){
        var cedula = textField.getValue();
        
        Ext.Ajax.request({
             url: 'app/controller/rol_controller.php?operacion=buscarUsuarioParaRol',
             //Enviando los parametros a la pagina servidora
             params: {
              Cedula: cedula
             },
             //Retorno exitoso de la pagina servidora a traves del formato JSON
             success: function( resultado, request ) {
              datos = Ext.JSON.decode(resultado.responseText);

              if (datos[0] != undefined) {
                var password = (datos[0].password == null) ? datos[0].passwdTablaSocios : datos[0].password;    // el operador ternario
                var idUsuario = (datos[0].idUsuario == null) ? undefined : datos[0].idUsuario;    // el operador ternario

                Ext.getCmp('txtCodSocio').setValue(datos[0].NumeroSocio);
                Ext.getCmp('txtCodSocio').setReadOnly(true);
                Ext.getCmp('txtNombres').setValue(datos[0].Nombres);
                Ext.getCmp('txtNombres').setReadOnly(true)
                Ext.getCmp('txtApellidos').setValue(datos[0].Apellidos);
                Ext.getCmp('txtApellidos').setReadOnly(true)
                Ext.getCmp('txtPassword').setValue(password).focus();
                Ext.getCmp('txtPassword').setReadOnly(false);
                Ext.getCmp('txtIdUsuario').setValue(idUsuario);
              }else{
                Ext.getCmp('txtCodSocio').setValue('X-0000');
                Ext.getCmp('txtCodSocio').setReadOnly(true);
                Ext.getCmp('txtNombres').setReadOnly(false);
                Ext.getCmp('txtNombres').setValue('');
                Ext.getCmp('txtNombres').focus();
                Ext.getCmp('txtApellidos').setReadOnly(false);
                Ext.getCmp('txtApellidos').setValue('');
                Ext.getCmp('txtPassword').setReadOnly(false);
                Ext.getCmp('txtPassword').setValue('');
                Ext.getCmp('txtIdUsuario').setValue('');
              }
             },
             //No hay retorno de la pagina servidora
             failure: function() {
              WindowMessage('Error', "Disculpe, ocurrio un error al consultar los datos...",Ext.MessageBox.ERROR);
             }
        });
    },

    onAgregarClick: function() {
        var form   = this.getView(),
            encode = Ext.String.htmlEncode,
            s      = '{';

        if (form.isValid()) {
            var storeUsuariosXRolGrid = Ext.getCmp('usuariosXrolGrid').getStore();
            console.log(form.getValues());
            var formValues = form.getValues();

            Ext.iterate(form.getValues(), function(key, value) {
                value = encode(value);
                
                s += Ext.util.Format.format("{0} : {1},", key, value);
            }, this);

            s += '}';
            Ext.Msg.alert('Form Values', s);
            //'Cedula','Nombres','Apellidos', 'Rol', 'idUsuario','NumeroSocio','idRol'
            storeUsuariosXRolGrid.insert(0,new ModeloUsuariosXRol({Cedula: formValues.txtCedula, Nombres: formValues.txtNombres, Apellidos: formValues.txtApellidos, Rol: rolSeleccionado.getRawValue(), idUsuario: formValues.txtIdUsuario, NumeroSocio: formValues.txtCodSocio, idRol: rolSeleccionado.getValue()}));
        }
    },

    onCancelarClick: function() {
        Ext.getCmp('winAgregarUsuario').hide();
    },

    /*onLoadClick: function() {
        this.getView().loadRecord(Ext.create('ModeloUsuariosXRol', {
            'txtNombres'    : 'abe@sencha.com',
            'txtApellidos'    : 'mr',
            'txtPassword': 'Abraham'
        }));
    }*/    
});

Ext.define('FContAgregarUsuarioARol', {
    extend: 'Ext.form.Panel',
    xtype: 'form-fieldcontainer',
    controller: 'winAgregarUsuario_Controller',
    //title: 'Employee Information',
    width: 400,
    bodyPadding: 10,
    defaults: {
        anchor: '100%'//,
        //labelWidth: 20
    },
    items: [{
        xtype: 'fieldcontainer',
        fieldLabel: 'Primero ingrese la cédula o el número de socio, luego rellene los demas campos de ser necesario',
        labelAlign: 'top',
        combineErrors: true,
        msgTarget : 'side',
        layout: 'fit',
        defaults: {
            flex: 1
        },
        items: [{
            xtype: 'numberfield',
            minValue: 0,
            hideTrigger: true,
            name: 'txtCedula',
            fieldLabel: 'Cédula:',
            labelPad: 0,
            margin: '5 5 0 0',
            allowBlank: false,
            listeners: {
                specialkey: 'onTxtCedulaSpecialKey', //para cuando se presiona una tecla especial
                blur: 'onTxtCedulaBlur',  // para controlar el lostFocus
                afterrender: function(field) {
                    field.focus();
                }
            }
        }]
    }, {
        xtype: 'fieldset',
        title: 'Datos Adicionales',
        collapsible: true,
        defaults: {
            labelWidth: 89,
            anchor: '100%',
            layout: {
                type: 'hbox',
                defaultMargins: {top: 0, right: 5, bottom: 0, left: 0}
            }
        },
        items: [            {
            xtype: 'fieldcontainer',
            fieldLabel: 'Codigo',
            combineErrors: true,
            msgTarget: 'side',
            defaults: {
                hideLabel: true
            },
            items: [
                {xtype: 'textfield', emptyText: 'X-0000', name: 'txtCodSocio', id: 'txtCodSocio',flex : 1, readOnly:true, allowBlank: false}
            ]
        },{
            xtype: 'fieldcontainer',
            fieldLabel: 'Nombre',
            combineErrors: true,
            msgTarget: 'side',
            defaults: {
                hideLabel: true
            },
            items: [
                {xtype: 'textfield', emptyText: 'Nombres', name: 'txtNombres', id: 'txtNombres',flex : 1,readOnly:true, allowBlank: false},
                {xtype: 'displayfield', value: ' , ', padding:'0 5 0 5 0'},
                {xtype: 'textfield',    emptyText: 'Apellidos', name: 'txtApellidos',id: 'txtApellidos', flex : 1, readOnly:true, allowBlank: false},
            ]
        }, {
            xtype : 'fieldcontainer',
            combineErrors: true,
            msgTarget: 'side',
            fieldLabel: 'Contraseña',
            defaults: {
                hideLabel: true
            },
            items: [{
                xtype: 'textfield',
                flex : 1,
                name : 'txtPassword',
                id : 'txtPassword',
                fieldLabel: 'First',
                allowBlank: false
            },
            {xtype: 'textfield', hidden:true, name: 'txtIdUsuario', id: 'txtIdUsuario'}
            ]
        }]
    }],
    
    buttons: [{
        text   : 'Agregar',
        handler: 'onAgregarClick',
        formBind: true, // Disponible hasta que los campos esten validados
        disabled: true
    }, {
        text     : 'Cancelar',
        handler  : 'onCancelarClick'
    }]
});

//****************************************************************************************************************


Ext.onReady(function() {
    //Ext.MessageBox.alert('Mensaje', "Felicitaciones!  La libreria: 5.1 esta instalada correctamente!");
   //***************************************************************************************************
    Ext.create('Ext.form.Panel', {
        title: 'Actualizar Roles de Usuario',
        id: 'panelUsuariosXrol',
        height: 500,
        width: '85%',
        layout: 'border',
        renderTo: 'formulario',
        resizable   : true,
        closable:true,
        draggable:true,
        modal: true,
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
            //Ext.create('treePreviewMenu'),
            Ext.create('FieldContUsuariosXrol')
        ]
    });
   //********************************************************************************************************

   Ext.create('Ext.window.Window', {
            extend: 'Ext.form.Panel',
            title: 'Agregar usuarios al rol seleccionado',
            id:'winAgregarUsuario',
            renderTo: 'formulario',
            modal: true,
            height: 300,
            width: 500,
            closeAction :'hide',
            layout: 'fit',
            items: [Ext.create('FContAgregarUsuarioARol')]/*,
            buttons: [{
                    text     : 'Cerrar',
                    handler  : function(){
                        Ext.getCmp('winAgregarUsuario').hide();
                    }
            }]*/
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

