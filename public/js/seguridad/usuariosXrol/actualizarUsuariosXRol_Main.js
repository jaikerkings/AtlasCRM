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
    $("#menuL_Cerrar_Ses").mousemove();
    $("#menuL_Cerrar_Ses").mouseover();
    //Ext.MessageBox.alert('Mensaje', "Felicitaciones!  La libreria: 5.1 esta instalada correctamente!");
   //***************************************************************************************************
    Ext.create('Ext.panel.Panel', {
        title: '<h1 style="font-family: Georgia, "Times New Roman", Times, serif;">Actualizar Roles de Usuario</h1></br>',
        id: 'panelPrincipal',
        height: 600,
        width: '95%',
        layout: 'border',
        renderTo: 'marcoExtJs',
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

