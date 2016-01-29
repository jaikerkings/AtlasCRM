$DEFAULT_IMG = "public/img/avatar_2x_small.png"
$CURRENT_USER_IMG = ""

class WelcomeController < ApplicationController
  def index
  	@fotoPorDefecto = ""
  	@fotoUsuarioActual = ""
	#Leyendo el contenido del archivo binario 
	content = ""
	File.open($DEFAULT_IMG, 'rb') do |f1|
	  while linea = f1.gets
	    content << linea
	  end
	end
	# Foto por defecto del usuario
	@fotoPorDefecto = "data:image/png;base64," + Base64.encode64(content)
	@fotoPorDefecto = @fotoPorDefecto.gsub(/\n/, '')
  end
end
