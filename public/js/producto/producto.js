/*
 * File: app/view/producto.js
 *
 * This file was generated by Sencha Architect version 3.2.0.
 * http://www.sencha.com/products/architect/
 *
 * This file requires use of the Ext JS 4.2.x library, under independent license.
 * License of Sencha Architect does not include license for Ext JS 4.2.x. For more
 * details see http://www.sencha.com/license or contact license@sencha.com.
 *
 * This file will be auto-generated each and everytime you save your project.
 *
 * Do NOT hand edit this file.
 */

Ext.define('MyApp.view.producto', {
    extend: 'Ext.window.Window',

    requires: [
        'Ext.form.Panel',
        'Ext.form.field.TextArea',
        'Ext.form.field.File',
        'Ext.form.field.ComboBox',
        'Ext.button.Button',
        'Ext.Img'
    ],

    height: 800,
    width: 900,
    layout: 'absolute',
    title: 'Producto',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'form',
                    x: 0,
                    y: -3,
                    height: 690,
                    layout: 'absolute',
                    bodyPadding: 10,
                    items: [
                        {
                            xtype: 'textfield',
                            x: 50,
                            y: 190,
                            fieldLabel: 'Precio'
                        },
                        {
                            xtype: 'textfield',
                            x: 50,
                            y: 60,
                            fieldLabel: 'Nombre'
                        },
                        {
                            xtype: 'textareafield',
                            x: 50,
                            y: 100,
                            width: 270,
                            fieldLabel: 'Descripción'
                        },
                        {
                            xtype: 'filefield',
                            x: 420,
                            y: 60,
                            width: 290,
                            fieldLabel: 'Imagen:'
                        },
                        {
                            xtype: 'combobox',
                            x: 50,
                            y: 250,
                            fieldLabel: 'Categoria:',
                            valueField: '1,2,3'
                        },
                        {
                            xtype: 'button',
                            x: 530,
                            y: 410,
                            text: 'Registrar'
                        },
                        {
                            xtype: 'button',
                            x: 630,
                            y: 410,
                            text: 'Cancelar'
                        },
                        {
                            xtype: 'image',
                            x: 490,
                            y: 100,
                            height: 201,
                            width: 201
                        }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});