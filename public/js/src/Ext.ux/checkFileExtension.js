/*********************************************************/
/*          Ext.ux.checkFileExtension.js                 */
/*********************************************************/
/*
  Autor  : Edgar Gonzalez
  Web    : http://egonzale.org
  Email  : egonzale@ucla.edu.ve
  Version: 1.3 en javascript 1.2
  Fecha  : 28 de mayo del 2013
*/

function checkFileExtension(elem,namefile,type) {
     var filePath = elem;

     if(filePath.indexOf('.') == -1)
         return false;
               
     var validExtensions = new Array();
     var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();

     if (type=="image") {
      validExtensions[0] = 'jpg';
      validExtensions[1] = 'png';
      validExtensions[2] = 'gif'; 
     }    

     for(var i = 0; i < validExtensions.length; i++) {
         if(ext == validExtensions[i])
             return true;
     }
     WindowMessage('Error', 'La extension .'+ext+' del archivo ' + filePath + ' no es permitida!',Ext.MessageBox.ERROR);
     document.getElementsByName(namefile)[0].value='';
     return false;
 }