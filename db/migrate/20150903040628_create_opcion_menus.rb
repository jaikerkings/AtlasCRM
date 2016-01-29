class CreateOpcionMenus < ActiveRecord::Migration
  def change
    create_table :opcion_menus do |t|
      t.integer :idOpcion
      t.string :descripcion
      t.string :rutaDeAcceso
      t.integer :idOpcionPadre
      t.string :estatus

      t.timestamps null: false
    end
  end
end
