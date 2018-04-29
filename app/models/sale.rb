class Sale < ApplicationRecord
  # Assosiations
  belongs_to :user
  belongs_to :company

  has_many :details, dependent: :destroy
  accepts_nested_attributes_for :details,
                                reject_if: :all_blank,
                                allow_destroy: true
end
