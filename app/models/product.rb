class Product < ApplicationRecord
  # Assositations
  belongs_to :company

  has_many :details, dependent: :destroy
end
