Ext.define('FieldContainer', {
    extend: 'Ext.form.Panel',
    xtype: 'form-fieldcontainer',
    //controller: 'form-fieldcontainer',
    title: 'Seleccione el Rol y luego agrégue los Módulos a los que puede acceder ése Rol:',
    region: 'center',
    collapsible: false,
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
                                Ext.getCmp('permisosGrid').getStore().load({
                                                            params: {
                                                            idRol: rolSeleccionado.getValue()
                                                            },
                                                            callback: function(records, operation, success) {
                                                                // do something after the load finishes
                                                            },
                                                            scope: this
                                });
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
                                xtype: 'button'
                            }, {
                                iconCls: null,
                                glyph: 'xf044@FontAwesome', //editar
                                xtype: 'button'
                            }, {
                                iconCls: null,
                                glyph: 'xf00d@FontAwesome', //remover
                                xtype: 'button'
                            }
                        ]
                    }
            ]
        }] 
    }, {
        /*====================================================================
         * Individual checkbox/radio examples
         *====================================================================*/

        // Using checkbox/radio groups will generally be more convenient and flexible than
        // using individual checkbox and radio controls, but this shows that you can
        // certainly do so if you only have a single control at a time.
        xtype: 'container',
        layout: 'hbox',
        margin: '0 0 10',
        items: [{
            xtype: 'fieldset',
            flex: 1,
            title: 'Módulos a los que tiene acceso',
            defaultType: 'checkbox', // each item will be a checkbox
            layout: 'anchor',
            defaults: {
                anchor: '100%',
                hideEmptyLabel: false
            },
            items: [Ext.create('PermisosGrid')]
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
        text   : 'Load test data',
        handler: 'onLoadClick'
    }, {
        text   : 'Save',
        handler: 'onSaveClick'
    }, {
        text   : 'Reset',
        handler: 'onResetClick'
    }]
});

Ext.onReady(function() {
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
            {
                title: 'Seleccione el Rol y luego agrégue los Módulos a los que puede acceder ése Rol:',
                collapsible: false,
                region:'center',
                margins: '5 0 0 0',
                width: '100%'
            }
        ]
    }).add(Ext.create('FieldContainer'));
   //********************************************************************************************************

   Ext.create('Ext.window.Window', {
            title: 'Agregar permisos al rol',
            id:'winAgregarPermiso',
            modal: true,
            height: 450,
            width: 500,
            closeAction :'hide',
            layout: 'fit',
            items: {
                xtype: 'fieldset',
                flex: 1,
                title: 'Módulos disponibles:',
                //defaultType: 'checkbox', // each item will be a checkbox
                layout: 'anchor',
                defaults: {
                    anchor: '100%',
                    hideEmptyLabel: false
                },
                items: [Ext.create('ModulosGrid')]
            }
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