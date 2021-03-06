/*
 * File: app/view/asignarCliente.js
 *
 * This file was generated by Sencha Architect version 3.2.0.
 * http://www.sencha.com/products/architect/
 *
 * This file requires use of the Ext JS 5.1.x library, under independent license.
 * License of Sencha Architect does not include license for Ext JS 5.1.x. For more
 * details see http://www.sencha.com/license or contact license@sencha.com.
 *
 * This file will be auto-generated each and everytime you save your project.
 *
 * Do NOT hand edit this file.
 */

Ext.define('administrador.view.asignarCliente', {
    extend: 'Ext.window.Window',
    alias: 'widget.asignarcliente',

    requires: [
        'administrador.view.asignarClienteViewModel',
        'Ext.form.Panel',
        'Ext.form.field.Text',
        'Ext.button.Button',
        'Ext.grid.Panel',
        'Ext.view.Table',
        'Ext.grid.column.Check',
        'Ext.form.FieldSet'
    ],

    viewModel: {
        type: 'asignarcliente'
    },
    height: 800,
    width: 900,
    title: 'Asignar Clientes',

    items: [
        {
            xtype: 'form',
            height: 540,
            layout: 'absolute',
            bodyPadding: 10,
            title: '',
            items: [
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 40,
                    fieldLabel: 'Ingrese Cedula o RIF'
                },
                {
                    xtype: 'button',
                    x: 330,
                    y: 50,
                    text: 'Buscar'
                },
                {
                    xtype: 'gridpanel',
                    x: 30,
                    y: 250,
                    width: 660,
                    title: 'Listado de Clientes',
                    columns: [
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'string',
                            text: 'Cedula o RIF'
                        },
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'string',
                            text: 'Nombre'
                        },
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'string',
                            text: 'Apellido'
                        },
                        {
                            xtype: 'checkcolumn',
                            text: 'Seleccionar'
                        }
                    ]
                },
                {
                    xtype: 'fieldset',
                    x: 30,
                    y: 90,
                    height: 130,
                    width: 370,
                    title: 'Datos del Ejecutivo',
                    items: [
                        {
                            xtype: 'textfield',
                            anchor: '100%',
                            fieldLabel: 'Nombre'
                        },
                        {
                            xtype: 'textfield',
                            anchor: '100%',
                            fieldLabel: 'Apellido'
                        },
                        {
                            xtype: 'textfield',
                            anchor: '100%',
                            fieldLabel: 'Correo Electronico'
                        }
                    ]
                },
                {
                    xtype: 'button',
                    x: 530,
                    y: 440,
                    text: 'Guardar'
                },
                {
                    xtype: 'button',
                    x: 630,
                    y: 440,
                    text: 'Cancelar'
                }
            ]
        }
    ]

});