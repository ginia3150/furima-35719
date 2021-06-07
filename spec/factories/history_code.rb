FactoryBot.define do
  factory :history_code do
    postal_code { '123-1324' }
    shipping_area_id { 2 }
    city { '千歳' }
    address { '千歳' }
    building_name { 'コーポ' }
    tel { '05012346587' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
