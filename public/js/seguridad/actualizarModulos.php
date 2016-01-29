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
	$("#btnSalir").click(function(){
		//location.reload(true);
		location.href = "http://cappaucla.ucla.edu.ve";
	});
</script>

</head>
<body>


<div id="botones2" style="position:relative;left:45%;display:inline-block;">
	<input type="button" name="btnSalir" id="btnSalir" value="Salir">
</div>
</body>
