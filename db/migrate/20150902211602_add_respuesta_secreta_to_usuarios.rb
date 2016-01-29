class AddRespuestaSecretaToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :respuestaSecreta, :string
  end
end
