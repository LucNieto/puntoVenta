class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.float :neto, default: 0
      t.float :neto_iva, default: 0
      t.float :total_compra, default: 0

      t.timestamps
    end
  end
end
