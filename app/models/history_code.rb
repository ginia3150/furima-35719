class HistoryCode
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :address, :building_name, :tel, :user_id, :product_id, :token
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :tel, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :product_id
    validates :token
  end
  
  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, product_id: product_id)
    PostalCode.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, tel: tel, purchase_history_id: purchase_history.id )
  end
end