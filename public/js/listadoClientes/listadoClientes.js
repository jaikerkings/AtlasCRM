/*
 * File: app/view/listadoClientes.js
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

Ext.define('winListadoClientes', {
    extend: 'Ext.window.Window',

    requires: [
        'Ext.data.*',
        //'Ext.chart.*',
        //'Ext.chart.Chart',
        'Ext.util.Point',
        //'Ext.chart.series.Pie',
        'Ext.form.Label',
        'Ext.grid.Panel',
        'Ext.grid.column.Number',
        'Ext.grid.column.Date',
        'Ext.grid.column.Boolean',
        'Ext.grid.View',
        //'Ext.chart.axis.Category',
        //'Ext.chart.axis.Numeric',
        //'Ext.chart.series.Line',
        'Ext.button.Button'
    ],
    id:'winListadoClientes',
    renderTo: 'formulario',
    autoShow: false,
    hidden: true,
    closeAction:'hide',
    floating: false,
    height: 800,
    width: 900,
    layout: 'absolute',
    title: 'Listados de Clientes',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'panel',
                    x: 0,
                    y: 0,
                    height: 800,
                    layout: 'absolute',
                    items: [
                        {
                            xtype: 'container',
                            x: 47,
                            y: 23
                        },
                        {
                            xtype: 'chart',
                            x: 440,
                            y: 70,
                            height: 250,
                            width: 400,
                            animate: true,
                            insetPadding: 20,
                            series: [
                                {
                                    type: 'pie',
                                    label: {
                                        field: 'x',
                                        display: 'rotate',
                                        contrast: true,
                                        font: '12px Arial'
                                    },
                                    showInLegend: true,
                                    angleField: 'y'
                                }
                            ]
                        },
                        {
                            xtype: 'label',
                            x: 560,
                            y: 50,
                            text: 'Estatus de lo Clientes'
                        },
                        {
                            xtype: 'gridpanel',
                            x: 30,
                            y: 70,
                            height: '',
                            width: 400,
                            title: 'Potenciales Clientes',
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
                                    text: 'Fecha'
                                },
                                {
                                    xtype: 'booleancolumn',
                                    dataIndex: 'bool',
                                    text: 'Estatus'
                                }
                            ]
                        },
                        {
                            xtype: 'gridpanel',
                            x: 30,
                            y: 400,
                            height: '',
                            width: 500,
                            title: 'Clientes en Agenda',
                            columns: [
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'string',
                                    text: 'Nombre'
                                },
                                {
                                    xtype: 'numbercolumn',
                                    dataIndex: 'number',
                                    text: 'Hora'
                                },
                                {
                                    xtype: 'datecolumn',
                                    dataIndex: 'date',
                                    text: 'Fecha'
                                },
                                {
                                    xtype: 'booleancolumn',
                                    dataIndex: 'bool',
                                    text: 'Ejecutivo Asigando'
                                }
                            ]
                        },
                        {
                            xtype: 'chart',
                            x: 550,
                            y: 380,
                            height: 250,
                            width: 300,
                            animate: true,
                            insetPadding: 20,
                            axes: [
                                {
                                    type: 'Category',
                                    fields: [
                                        'x'
                                    ],
                                    title: 'Category Axis',
                                    categoryNames: [
                                        'Meses'
                                    ],
                                    position: 'bottom'
                                },
                                {
                                    type: 'Numeric',
                                    fields: [
                                        'y'
                                    ],
                                    title: 'Numeric Axis',
                                    position: 'left'
                                }
                            ],
                            series: [
                                {
                                    type: 'line',
                                    xField: 'x',
                                    yField: 'y',
                                    smooth: 3
                                }
                            ]
                        },
                        {
                            xtype: 'button',
                            x: 757,
                            y: 659,
                            text: 'Cancelar'
                        }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});

Ext.onReady(function() {
    Ext.create('winListadoClientes');
});