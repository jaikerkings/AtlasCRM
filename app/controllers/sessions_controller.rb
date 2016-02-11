
class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
  end

  def create
  	@email = params[:nombreUsu]
	  @clave = params[:password]
	  
	  existe, objUsuario = Usuario.new.buscarXemailYclave @email, @clave
	
  	if existe == 1
  		session[:current_user_id] = objUsuario.id
  		session[:current_user_rol] = objUsuario.idRol
  		session[:current_user_name] = objUsuario.email

  		fotoUsuario = "#{objUsuario.formatoFoto}" + Base64.encode64(objUsuario.foto);
      fotoUsuario = fotoUsuario.gsub(/\n/, '')
  		$CURRENT_USER_IMG = fotoUsuario #variable global definida en welcome_controller

  		@tirajson = '{"success": "true", "exito": "true", "msg": "usuario existe", "foto": "'+fotoUsuario+'"}'
  	else
  		@tirajson = '{"success": "true", "exito": "false", "msg": "Error de usuario y/o contraseña."}'
  	end

	  render :json => @tirajson

  	/if user = Usuario.find_by(params[:username], params[:password])
      session[:current_user_id] = user.id
      redirect_to root_url
    else
      render 'new'
    end
    /
  end

  def destroy
  	# Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
    $CURRENT_USER_IMG = "" #variable global definida en welcome_controller
    reset_session
    redirect_to root_url
  end
end
