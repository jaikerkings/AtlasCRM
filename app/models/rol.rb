class Rol < ActiveRecord::Base
	def BuscarUsuariosPorRol(idRol)
		@usuariosXrol = Rol.find_by_sql "Select usuarios.idUsuario AS idUsuario, usuarios.username AS NombreUsuario, usuarios.email AS Email, rols.descripcion AS Rol, usuarios.formatoFoto AS FormatoFoto, usuarios.formatoFoto AS Foto, usuarios.idRol AS idRol From usuarios INNER JOIN rols ON (usuarios.idRol=rols.idRol) WHERE usuarios.idRol=#{idRol}"

   		return @usuariosXrol
	end

	def BuscarPermisosPorRol(idRol)
		@permisosXrol = Rol.find_by_sql "Select rols.descripcion AS Rol, opcion_menus.descripcion AS Modulo, puedeGrabar AS PuedeGrabar, puedeConsultar AS PuedeConsultar, puedeEliminar AS PuedeEliminar, opciones_por_rols.idOpcion, opciones_por_rols.idRol From opciones_por_rols INNER JOIN rols ON (rols.idRol=opciones_por_rols.idRol) INNER JOIN opcion_menus ON (opcion_menus.idOpcion=opciones_por_rols.idOpcion) WHERE opciones_por_rols.idRol=#{idRol}"

		return @permisosXrol
	end
end
