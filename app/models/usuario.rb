class Usuario < ActiveRecord::Base
	def buscarXemailYclave(usuario,clave)
	  registros = Usuario.where(["email = '#{usuario}' and contrasenha = '#{clave}'"])
	  
	  unless registros.empty?
	   @existe = 1
	   @registro = registros.take
	  else
	   @existe = 0
	   @registro = nil
	  end
	  return @existe, @registro
 	end
end
