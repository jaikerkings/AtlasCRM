class OpcionesPorRol < ActiveRecord::Base #corresponde a la tabla OpcionesPorRol del profe
  @@nro=0

  #ContarHijos, Usado por el metodo: BuscarTodosArbolJson
  def ContarHijos(idRol,idPadre)
   #@@nro=@@nro+1
   #@son = OpcionesPorRol.count(:conditions => "idRol=#{idRol} and padre_id=#{padreid}" )
   #@son = OpcionesPorRol.find_by_sql "Select count(*) as son From OpcionesPorRol where idRol="+idRol.to_s+" and padre_id="+padreid.to_s

   @son = OpcionMenu.find_by_sql "SELECT COUNT(*) AS cantHijos FROM opcion_menus INNER JOIN opciones_por_rols ON (opcion_menus.idOpcion = opciones_por_rols.idOpcion AND opciones_por_rols.idRol="+idRol.to_s+") WHERE opcion_menus.idOpcionPadre = "+idPadre.to_s+" AND opcion_menus.Estatus='A'"

   return @son.first.cantHijos
  end
  
  #ObtenerHijos, Usado por el metodo: BuscarTodosArbolJson
  def ObtenerHijos(idRol,padreid)
  	totaldeRegistros = self.ContarHijos(idRol,padreid)
	#out_file = File.new("out.txt", "w+")
   	#out_file.puts "padreid "+padreid.to_s +" tr1 "+totaldeRegistros.to_s
   	#out_file.close
   	#File.open("out.txt", "w+") { |file| file.write(idRol.to_s+" "+padreid.to_s+" "totaldeRegistros.to_s) }
	if totaldeRegistros > 0
		@tira = @tira+"  children: [ "
		#@OpcionesPorRol = OpcionesPorRol.find(:all, :conditions => "idRol=#{idRol} and padre_id=#{padreid}" )
	  	#@OpcionesPorRol = OpcionesPorRol.where("idRol = ? AND padre_id = ?", idRol, padreid)
	  	@OpcionesPorRol = OpcionesPorRol.find_by_sql "SELECT opcion_menus.idOpcion, idOpcionPadre, descripcion, rutaDeAcceso, PuedeConsultar, PuedeGrabar, PuedeEliminar FROM opcion_menus INNER JOIN opciones_por_rols ON (opcion_menus.idOpcion = opciones_por_rols.idOpcion AND opciones_por_rols.idRol="+idRol.to_s+") WHERE opcion_menus.idOpcionPadre = "+padreid.to_s+" AND opcion_menus.Estatus='A';"
	  	i=0
	  	@OpcionesPorRol.each do |opcion|
		   	@tira = @tira+" { text: '" + opcion.descripcion + "', id: '" + opcion.idOpcion.to_s  + "', href: 'javascript:cargarOpcion()', ruta:'"+opcion.rutaDeAcceso+"', "
		   	self.ObtenerHijos(idRol,opcion.idOpcion)
		   	i=i+1
		   	if i < totaldeRegistros
		   		@tira = @tira+" }, "
		   	else
		   		@tira = @tira+" } ] "
		   	end
	   	end
	else
		@tira = @tira+"  leaf: true  "
	end
  end
	
  #Buscar todos los nodos y generar en formato JSON para Ext.tree.Panel
  def BuscarOpcionesDeMenuPorRol(idRol)
  	@OpcionesPorRol = OpcionesPorRol.new
   	totaldeRegistros = self.ContarHijos(idRol,0);
   	@tira='[ '
   	if totaldeRegistros > 0            
		#@OpcionesPorRol = OpcionesPorRol.find(:all, :conditions => "idRol=#{idRol} and padre_id=0" )
		#@OpcionesPorRol = OpcionesPorRol.where("idRol = ? AND padre_id = ?", idRol, 0)
		@OpcionesPorRol = OpcionesPorRol.find_by_sql "SELECT opcion_menus.idOpcion, descripcion, rutaDeAcceso, idOpcionPadre FROM opcion_menus INNER JOIN opciones_por_rols ON (opcion_menus.idOpcion = opciones_por_rols.idOpcion AND opciones_por_rols.idRol="+idRol.to_s+") WHERE opcion_menus.idOpcionPadre = 0 AND opcion_menus.Estatus='A'"
		j=0
		@OpcionesPorRol.each do |opcion|
			@tira = @tira+" { text: '" + opcion.descripcion + "',expanded: true, id: '" + opcion.idOpcion.to_s  + "', href: '', "
			self.ObtenerHijos(idRol,opcion.idOpcion)
			j=j+1
			if j < totaldeRegistros
				@tira = @tira+ " }, "
			else
				@tira = @tira+" } ] "
			end
		end
	else
		@tira= @tira+"{ { text: 'No hay datos', id: '0', href: '', leaf: true } } ]"
	end
	
	return @tira
  end

  def BuscarListaArchivosAcargarPorRol(idRol)
  	@RutasAcargarPorRol = OpcionesPorRol.new
  	@RutasAcargarPorRol = OpcionesPorRol.find_by_sql "SELECT opcion_menus.idOpcion, rutaDeAcceso FROM opcion_menus INNER JOIN opciones_por_rols ON (opcion_menus.idOpcion = opciones_por_rols.idOpcion AND opciones_por_rols.idRol="+idRol.to_s+") WHERE opcion_menus.Estatus='A'"

  	return @RutasAcargarPorRol
  end

  #Actualizar Nodo
  def Actualizar(idnodo, nombrenodo, tipo, padreid)
   nodo = OpcionesPorRol.find_by(id: "#{idnodo}")
   if nodo.nil?
    return 0
   else
    nodo.update(text: "#{nombrenodo}")
    return 1
   end
  end
  
  #Agregar Nodo
  def Agregar(idnodo, nombrenodo, tipo, padreid, vinculo)
   vinculo = "ejemplo01";
   unless OpcionesPorRol.exists?(:text => "#{nombrenodo}")
    @OpcionesPorRol = OpcionesPorRol.new 
    @OpcionesPorRol.tipo = tipo
    @OpcionesPorRol.padre_id = padreid
    @OpcionesPorRol.text = nombrenodo
    @OpcionesPorRol.vinculo = vinculo
    @OpcionesPorRol.save
    @son = OpcionesPorRol.maximum("id")
    return @son, vinculo
   end
   return 0, vinculo
  end
  
  #Eliiminar Nodo
  def Eliminar(id)
   if OpcionesPorRol.exists?(id)
    arbol = OpcionesPorRol.find_by(id: "#{id}")
    arbol.destroy
    if arbol.destroyed?
     return id
    else
     return 0
    end      
   end 
   return 0
  end
end
