Ext.onReady(function() {

	Ext.get('btnLogin').on('click', function(){
      var nombreUsuario = Ext.get('username').getValue();
      var password = Ext.get('password').getValue();
	  
	  if ((nombreUsuario != "") && (password != "")){
      	Ext.Ajax.request({
			url : 'login/login' , 
			params : { nombreUsu : nombreUsuario, password: password},
			method: 'POST',
			success: function ( result, request ) { 
				$("body").load("app/index");
				
				Ext.Msg.alert('Mensaje', result.responseText);
			},
			failure: function ( result, request) { 
				Ext.Msg.alert('Error', result.responseText); 
			} 
	    });
      }else{
      	Ext.Msg.alert('Error', 'Primero debes ingresar tu nombre de usuario y contraseña.');
      }
      
    });
});
