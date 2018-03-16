class CreateBussinesNames < ActiveRecord::Migration[5.1]
  def change
    create_table :bussines_names do |t|
      t.string :nombre
      t.string :rfc
      t.string :direccion_fiscal

      t.timestamps
    end
  end
end
