class Company < ApplicationRecord
  # Assosiations
  belongs_to :bussines_name
  has_many :sales, dependent: :destroy
  has_many :products, dependent: :destroy
end
