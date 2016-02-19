/*
 * File: app/view/membresia.js
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

Ext.define('winMembresia', {
    extend: 'Ext.window.Window',
    alias: 'widget.membresia',

    requires: [
        //'administrador.view.membresiaViewModel',
        'Ext.form.Panel',
        'Ext.button.Button',
        'Ext.form.FieldSet',
        'Ext.form.field.Date',
        'Ext.form.field.TextArea',
        'Ext.grid.Panel',
        'Ext.view.Table',
        'Ext.grid.column.Check',
        'Ext.grid.column.Number',
        'Ext.grid.column.Date'
    ],

    /*viewModel: {
        type: 'membresia'
    },*/
    id:'winMembresia',
    renderTo: 'formulario',
    autoShow: false,
    hidden: true,
    closeAction:'hide',
    floating: false,
    height: 800,
    width: 900,
    title: 'Membresia',

    items: [
        {
            xtype: 'form',
            height: 663,
            width: 880,
            layout: 'absolute',
            bodyPadding: 10,
            title: '',
            items: [
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 30,
                    fieldLabel: 'Ingrese Codigo'
                },
                {
                    xtype: 'button',
                    x: 320,
                    y: 30,
                    text: 'Buscar'
                },
                {
                    xtype: 'fieldset',
                    x: 30,
                    y: 70,
                    height: 310,
                    width: 400,
                    title: 'Datos',
                    items: [
                        {
                            xtype: 'textfield',
                            anchor: '100%',
                            width: 350,
                            fieldLabel: 'Nombre'
                        },
                        {
                            xtype: 'textfield',
                            anchor: '100%',
                            fieldLabel: 'Precio'
                        },
                        {
                            xtype: 'datefield',
                            fieldLabel: 'Fecha'
                        },
                        {
                            xtype: 'textareafield',
                            anchor: '100%',
                            height: 179,
                            fieldLabel: 'Descripcion'
                        }
                    ]
                },
                {
                    xtype: 'button',
                    x: 690,
                    y: 370,
                    text: 'Registrar'
                },
                {
                    xtype: 'button',
                    x: 790,
                    y: 370,
                    text: 'Cancelar'
                },
                {
                    xtype: 'gridpanel',
                    x: 520,
                    y: 70,
                    height: 230,
                    width: 250,
                    title: 'Opciones',
                    columns: [
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'string',
                            text: 'Descripcion'
                        },
                        {
                            xtype: 'checkcolumn',
                            text: 'Seleccionar'
                        }
                    ]
                },
                {
                    xtype: 'gridpanel',
                    x: 30,
                    y: 420,
                    title: 'Listado de Membresias',
                    columns: [
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'string',
                            text: 'Codigo'
                        },
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'string',
                            text: 'Descripcion'
                        },
                        {
                            xtype: 'numbercolumn',
                            dataIndex: 'number',
                            text: 'Numero de Sucripciones'
                        },
                        {
                            xtype: 'numbercolumn',
                            dataIndex: 'number',
                            text: 'Precio'
                        },
                        {
                            xtype: 'datecolumn',
                            dataIndex: 'date',
                            text: 'Fecha '
                        }
                    ]
                }
            ]
        }
    ]

});

Ext.onReady(function() {
    Ext.create('winMembresia');
});