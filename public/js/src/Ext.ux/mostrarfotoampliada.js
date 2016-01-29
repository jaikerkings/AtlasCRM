/**
 * Ext.ux.mostrarfotoampliada
 *
 * @author    : Edgar Gonzalez
 * @date      : 16 de marzo del 2013
 * @email     : egonzale@ucla.edu.ve
 */

function mostrarfotoampliada(lafoto)  {

	   
	   //Definicion de la clase MiVentana
	   Ext.define('myWindow', {
	    extend: 'Ext.window.Window',

	                layout      : 'absolute',
	                width       : 600,
	                height      : 500,
	                x: parseInt((screen.width/2)-(600/2)),
	                y: parseInt((screen.height/2)-(500/2)),
	                closeAction :'hide',
	                plain       : true,
	                closable    : true,
	                closeAction : 'hide',
	                constrain   : true,
	                resizable   : false,
	                maxizable   : true,
	                title       : "Mostrar Foto Ampliada",
	                buttonAlign : 'center',
	                items:[
	                 { xtype:'image',
	                   width: 590,
	                   height: 490,
	                   src: lafoto
	                 }
	                ]


	            });
	   var win = Ext.create('myWindow');
	   win.show();
}