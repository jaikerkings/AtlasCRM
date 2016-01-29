/*********************************************************/
/*              Ext.ux.previewImage.js                   */
/*********************************************************/
/*
  Autor  : Edgar Gonzalez
  Web    : http://egonzale.org
  Email  : egonzale@ucla.edu.ve
  Version: 1.3 en javascript 1.2
  Fecha  : 28 de mayo del 2013
*/

function previewImage(input,nameFoto,idFoto,type) {

	if (!checkFileExtension(document.getElementsByName(nameFoto)[0].value,nameFoto,type))
	{
	 return false;	
	}
    if (input.files && input.files[0]) {
     var reader = new FileReader();
     reader.onload = function (e) {
      document.getElementById(idFoto).src = e.target.result;
      //Variables globales a ser declarada al comienzo de cada componente
      //En nuestro caso fotobytes
      switch(idFoto)
      {
      case 'foto':
    	fotobytes = e.target.result;
        break;
      default:
        break;
      }
      
     }
     reader.readAsDataURL(input.files[0]);
    }
 return true;
}