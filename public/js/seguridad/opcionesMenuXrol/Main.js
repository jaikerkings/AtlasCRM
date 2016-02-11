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
    $("#menuL_Cerrar_Ses").mousemove();
    $("#menuL_Cerrar_Ses").mouseover();
    //Ext.MessageBox.alert('Mensaje', "Felicitaciones!  La libreria: 5.1 esta instalada correctamente!");
   //***************************************************************************************************
    Ext.create('Ext.panel.Panel', {
        title: '<h1 style="font-family: Georgia, "Times New Roman", Times, serif;">Actualizar Derechos de Acceso por Rol de Usuario</h1></br>',
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

/*
{
        xtype: 'fieldset',
        title: 'Módulos y permisos para éste Rol',
        collapsible: false,
        defaults: {
            //labelWidth: 89,
            layout: {
                type: 'hbox',
                defaultMargins: {top: 0, right: 5, bottom: 0, left: 0}
            }
        },
        items: [{
            xtype: 'fieldset',
            title: 'Módulos a los que tiene acceso',
            collapsible: false,
            defaults: {
                //labelWidth: 89,
                anchor: '70%',
                layout: {
                    type: 'vbox',
                    defaultMargins: {top: 0, right: 5, bottom: 0, left: 0}
                }
            }
        }, {
            xtype: 'fieldset',
            title: 'Módulos disponibles',
            collapsible: false,
            defaults: {
                //labelWidth: 89,
                anchor: '20%',
                layout: {
                    type: 'vbox',
                    defaultMargins: {top: 0, right: 5, bottom: 0, left: 0}
                }
            }
        }, {
            xtype: 'fieldset',
            title: 'Permisos para éste módulo',
            collapsible: false,
            defaults: {
                //labelWidth: 89,
                anchor: '10%',
                layout: {
                    type: 'vbox',
                    defaultMargins: {top: 0, right: 5, bottom: 0, left: 0}
                }
            }
        }

*/