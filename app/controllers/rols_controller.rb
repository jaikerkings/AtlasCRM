class RolsController < ApplicationController
	def obtenerMenuOpcionesPorRol
		idRol = params[:idRol]

		@tira = OpcionesPorRol.new.BuscarOpcionesDeMenuPorRol idRol
		render :json => @tira
	end

	def buscarRoles
		@tira = Rol.all
		render :json => @tira
	end

	def buscarUsuariosPorRol
		idRol = params[:idRol]
		@tira = Rol.new.BuscarUsuariosPorRol idRol
		render :json => @tira
	end

	def buscarPermisosPorRol
		idRol = params[:idRol]
		@tira = Rol.new.BuscarPermisosPorRol idRol
		render :json => @tira
	end
end
