<?php if (session_id()=="") session_start(); 
if (empty($_SESSION["cedula"])){
    echo("<script type='text/javascript'>$(document).ready(function(){
        $('#AcepIniSes').click(function(){
        $('body').append('<div id=overlay />');
        $('#overlay').fadeTo('fast', 0.3);
        $('#login-box').stop().fadeIn();
        $('#login').focus();
      });
      
      $('#Salir').click(function(){
        location.href = 'http://cappaucla.ucla.edu.ve';
      });
    });</script>");
    
    die("</br></br></br></br><h1>Disculpe, usted debe iniciar sesi&oacute;n para poder visualizar esta secci&oacute;n.</br></br>Si lo desea, presione &quot;Aceptar&quot; para iniciar sesi&oacute;n.</h1></br></br><div id='botones2' style='position:relative;left:33%;display:inline-block;'><input type='button' value='Aceptar' id='AcepIniSes'/><div id='botones3' style='position:relative;left:40%;display:inline-block;'><input type='button' value='Salir' id='Salir'/></div></div>");
}

?>

<!DOCTYPE html>
<head>
<script type="text/javascript">
  //variables globales visibles para todos los .js cargados despues
  var rolSeleccionado = null; 
  var itemUsuariosXRolGridSeleccionado = null;
  var moduloSeleccionado = null; 

  $("#btnSalir").click(function(){
    //location.reload(true);
    location.href = "http://cappaucla.ucla.edu.ve";
  });
</script>
<script src="app/view/opciones/seguridad/ModelsSeguridad.js" type="text/javascript"></script>
<script src="app/view/opciones/seguridad/StoresSeguridad.js" type="text/javascript"></script>
<script src="app/view/opciones/seguridad/usuariosXrol/DataGridUsuariosXRol.js" type="text/javascript"></script>
<!--<script src="app/view/opciones/seguridad/usuariosXrol/AgregarNuevoModulo.js" type="text/javascript"></script>
<script src="app/view/opciones/seguridad/usuariosXrol/DataGridModulos.js" type="text/javascript"></script>
<script src="app/view/opciones/seguridad/usuariosXrol/TreePreviewMenu.js" type="text/javascript"></script>-->
<script src="app/view/opciones/seguridad/usuariosXrol/actualizarUsuariosXRol_Main.js" type="text/javascript"></script>

</head>
<body>
<div id="users-contain" class="ui-widget" align="center" style="padding: 0px 50px 0px 50px;">
<!--<h1 style="font-family: Georgia, 'Times New Roman', Times, serif;">Actualizar Derechos de Acceso por Rol de Usuario</h1>-->
</br>
</div>

<!--
<div id="botones2" style="position:relative;left:45%;display:inline-block;">
  <input type="button" name="btnSalir" id="btnSalir" value="Salir">
</div>-->
</body>
