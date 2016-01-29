class AddContrasenhaToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :contrasenha, :string
  end
end
