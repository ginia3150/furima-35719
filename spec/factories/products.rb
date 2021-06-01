FactoryBot.define do
  factory :product do
    name {Faker::Name.last_name}
    description {"test"}
    category_id {3}
    condition_id {3}
    shipping_charge_id {3}
    shipping_area_id {3}
    day_to_ship_id {3}
    price {456789}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/test.png'), filename: 'test_image.png')
    end
  end
end
