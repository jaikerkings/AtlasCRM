class AppController < ApplicationController
  def index
  	idRol = session[:current_user_rol]
  	@listaRutasAcargar = OpcionesPorRol.new.BuscarListaArchivosAcargarPorRol idRol
  	p "hola @listaRutasAcargar"
  end

  def prueba
  	idRol = params[:idRol]

	@listaRutasAcargar = OpcionesPorRol.new.BuscarListaArchivosAcargarPorRol idRol
	#render :json => @listaRutasAcargar
  end
end
