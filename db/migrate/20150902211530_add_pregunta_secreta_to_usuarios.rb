class AddPreguntaSecretaToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :preguntaSecreta, :string
  end
end
