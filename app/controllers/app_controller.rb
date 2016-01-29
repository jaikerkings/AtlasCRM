class AppController < ApplicationController
  def index
  	idRol = params[:idRol]
  	@listaRutasAcargar = OpcionesPorRol.new.BuscarListaArchivosAcargarPorRol idRol
  end

  def prueba
  	idRol = params[:idRol]

	@listaRutasAcargar = OpcionesPorRol.new.BuscarListaArchivosAcargarPorRol idRol
	#render :json => @listaRutasAcargar
  end
end
