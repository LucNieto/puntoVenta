class CreateDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :details do |t|
      t.references :sale, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :cantidad, default: 0
      t.float :importe, default: 0

      t.timestamps
    end
  end
end
