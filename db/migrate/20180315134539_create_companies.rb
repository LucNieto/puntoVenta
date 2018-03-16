class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.references :bussines_name, foreign_key: true
      t.string :nombre
      t.string :direccion

      t.timestamps
    end
  end
end
