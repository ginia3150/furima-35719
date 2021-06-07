class PurchaseHistory < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :postal_code
end