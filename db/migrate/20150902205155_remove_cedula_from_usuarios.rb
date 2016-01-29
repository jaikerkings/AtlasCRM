class RemoveCedulaFromUsuarios < ActiveRecord::Migration
  def change
    remove_column :usuarios, :cedula, :string
  end
end
