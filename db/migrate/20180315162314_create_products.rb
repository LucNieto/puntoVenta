class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :company, foreign_key: true
      t.string :nombre
      t.string :descripcion
      t.integer :cantidad
      t.float :precio_compra
      t.float :precio_venta

      t.timestamps
    end
  end
end
