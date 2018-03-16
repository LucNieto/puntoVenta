class BussinesName < ApplicationRecord
  # Assosiations
  has_many :companies, dependent: :destroy

  # Validations
  validates :nombre, uniqueness: true
  validates :nombre, length: { minimum: 3 }
  validates :rfc, length: { is: 13 }
end
