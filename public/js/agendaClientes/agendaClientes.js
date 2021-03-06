/*
 * File: app/view/agendaClientes.js
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

Ext.define('MyApp.view.agendaClientes', {
    extend: 'Ext.window.Window',

    requires: [
        'Ext.form.field.Date',
        'Ext.form.field.Time',
        'Ext.menu.DatePicker',
        'Ext.grid.Panel',
        'Ext.grid.column.Number',
        'Ext.grid.column.Date',
        'Ext.grid.column.Boolean',
        'Ext.grid.View',
        'Ext.button.Button'
    ],

    height: 800,
    width: 900,
    layout: 'absolute',
    title: 'Agenda de Reuniones',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'panel',
                    x: 0,
                    y: 30,
                    height: 390,
                    layout: 'absolute',
                    items: [
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 20,
                            fieldLabel: 'Nombre del Cliente',
                            enableKeyEvents: true
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 70,
                            fieldLabel: 'Asunto'
                        },
                        {
                            xtype: 'datefield',
                            x: 20,
                            y: 110,
                            fieldLabel: 'Fecha:'
                        },
                        {
                            xtype: 'timefield',
                            x: 20,
                            y: 150,
                            fieldLabel: 'Hora:'
                        },
                        {
                            xtype: 'datemenu',
                            x: 310,
                            y: 10,
                            floating: false,
                            height: 210
                        },
                        {
                            xtype: 'gridpanel',
                            x: 320,
                            y: 240,
                            saveDelay: 400,
                            width: 510,
                            title: 'Agenda De Reuniones',
                            columns: [
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'string',
                                    text: 'String'
                                },
                                {
                                    xtype: 'numbercolumn',
                                    dataIndex: 'number',
                                    text: 'Number'
                                },
                                {
                                    xtype: 'datecolumn',
                                    dataIndex: 'date',
                                    text: 'Date'
                                },
                                {
                                    xtype: 'booleancolumn',
                                    dataIndex: 'bool',
                                    text: 'Boolean'
                                }
                            ]
                        },
                        {
                            xtype: 'button',
                            x: 30,
                            y: 250,
                            text: 'Generar Reunion'
                        },
                        {
                            xtype: 'button',
                            x: 160,
                            y: 250,
                            text: 'Cancelar'
                        }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});