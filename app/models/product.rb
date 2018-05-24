class Product < ApplicationRecord
  # Assositations
  belongs_to :company

  has_many :details, dependent: :destroy

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      products = find_by(id: row["id"]) || new
      products.attributes = row.to_hash
      products.save!
    end
  end
end
