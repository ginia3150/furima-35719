class PostalCode < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchase_history
  belongs_to :shipping_area
end
