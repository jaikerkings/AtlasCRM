class RolsController < ApplicationController
	def obtenerMenuOpcionesPorRol
		idRol = params[:idRol]

		@tira = OpcionesPorRol.new.BuscarOpcionesDeMenuPorRol idRol
		render :json => @tira
	end
end
