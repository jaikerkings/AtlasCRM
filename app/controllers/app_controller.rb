class AppController < ApplicationController
  def index
  	idRol = session[:current_user_rol]
    #buscamos las rutas de los .js que se necesitan cargar para este rol
  	@listaRutasAcargar = OpcionesPorRol.new.BuscarListaArchivosAcargarPorRol idRol
  	
    #procedemos a llenar un archivo con las instrucciones para que se cargen 
    #automaticamente los .js de los formularios a los que tiene acceso este rol
    #estos se cargaran desde el archivo index.html.erb de este controller

    #File.open(ruta, "w") abre el archivo con permiso de escritura y borra el contenido
    obj_file = File.open("app/views/app/_archivosJSaCargarPorRol.html.erb", "w")
    @listaRutasAcargar.each do |ruta|
      if ruta.rutaDeAcceso != ""
        obj_file.puts "<script type='text/javascript' src='#{ruta.rutaDeAcceso}'></script>"
      end  
    end
    #obj_file.puts "<script type='text/javascript' src='js/app/app.js'></script>"
    obj_file.close
  end

  def prueba
  	idRol = session[:current_user_rol]

	  @listaRutasAcargar = OpcionesPorRol.new.BuscarListaArchivosAcargarPorRol idRol
	  #render :json => @listaRutasAcargar
  end
end
