class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.integer :idUsuario
      t.string :email
      t.string :username
      t.string :contrasenha
      t.integer :idRol
      t.string :preguntaSecreta
      t.string :respuestaSecreta
      t.string :recordarSesion
      t.string :formatoFoto
      t.string :foto

      t.timestamps null: false
    end
  end
end
