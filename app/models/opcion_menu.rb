class OpcionMenu < ActiveRecord::Base
	def buscarTodos
   		#@son = OpcionesPorRol.count(:conditions => "idRol=#{idRol} and padre_id=#{padreid}" )
   	
   		#"SELECT OpcionesHijas.descripcion AS Modulo, OpcionesHijas.rutaDeAcceso, OpcionesPadre.descripcion AS OpcionPadre, OpcionesHijas.idOpcion, OpcionesHijas.idOpcionPadre, OpcionesHijas.updated_at FROM opcion_menus AS OpcionesHijas LEFT OUTER JOIN opcion_menus AS OpcionesPadre ON OpcionesPadre.idOpcion = OpcionesHijas.idOpcionPadre WHERE (OpcionesHijas.Estatus = 'A') ORDER BY OpcionPadre, Modulo;";
   		@modulos = OpcionMenu.find_by_sql "SELECT OpcionesHijas.descripcion AS Modulo, OpcionesHijas.rutaDeAcceso AS LinkDeAcceso, OpcionesPadre.descripcion AS OpcionPadre, OpcionesHijas.idOpcion, OpcionesHijas.idOpcionPadre, OpcionesHijas.updated_at FROM opcion_menus AS OpcionesHijas LEFT OUTER JOIN opcion_menus AS OpcionesPadre ON OpcionesPadre.idOpcion = OpcionesHijas.idOpcionPadre WHERE (OpcionesHijas.Estatus = 'A') ORDER BY OpcionPadre, Modulo"

   		return @modulos
  	end
end
