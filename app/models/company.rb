class Company < ApplicationRecord
  # Assosiations
  belongs_to :bussines_name
  has_many :sales, dependent: :destroy
  has_many :products, dependent: :destroy

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      companies = find_by(id: row["id"]) || new
      companies.attributes = row.to_hash
      companies.save!
    end
  end
end
