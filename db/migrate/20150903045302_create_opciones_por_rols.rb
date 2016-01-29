class CreateOpcionesPorRols < ActiveRecord::Migration
  def change
    create_table :opciones_por_rols do |t|
      t.integer :idOpcion
      t.integer :idRol
      t.string :detalles
      t.boolean :puedeGrabar
      t.boolean :puedeConsultar
      t.boolean :puedeEliminar

      t.timestamps null: false
    end
  end
end
