class OpcionMenusController < ApplicationController
	#def obtenerMenuOpcionesPorRol
	#	idRol = params[:idRol]

	#	@tira = OpcionesPorRol.new.BuscarOpcionesDeMenuPorRol idRol
	#	render :json => @tira
	#end

	def buscarModulos
		#idRol = params[:idRol]
	
		@tira = OpcionMenu.new.buscarTodos 
		render :json => @tira
	end
end
