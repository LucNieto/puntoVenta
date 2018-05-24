require 'csv'

class BussinesName < ApplicationRecord
  # Assosiations
  has_many :companies, dependent: :destroy

  # Validations
  validates :nombre, uniqueness: true
  validates :nombre, length: { minimum: 3 }
  validates :rfc, length: { is: 13 }

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      bussines_name = find_by(id: row["id"]) || new
      bussines_name.attributes = row.to_hash
      bussines_name.save!
    end
  end
end
