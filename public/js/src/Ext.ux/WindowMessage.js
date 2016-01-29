/*********************************************************/
/*                Ext.ux.WindowMessage                   */
/*********************************************************/
/*
  Autor  : Edgar Gonzalez
  Web    : http://egonzale.org
  Email  : egonzale@ucla.edu.ve
  Version: 1.3 en javascript 1.2
  Fecha  : 28 de mayo del 2013
*/

function WindowMessage(titulomensaje,textomensaje,iconomensaje) 
{
 Ext.MessageBox.show({
               	 title: titulomensaje,
               	 msg: textomensaje,
				 floating: true,
                 closable : true,
				 modal: true,
               	 //buttons: Ext.MessageBox.YESNO,
               	 buttons: Ext.MessageBox.OK,
               	 icon: iconomensaje,
               	 fn: function (id, value, opt) {
               	  if (id === 'ok') {
               	  }
               	 }
               });
 return true;
}