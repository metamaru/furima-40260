FactoryBot.define do
  factory :order_form do
    user
    item
    post_code { "#{Faker::Address.zip_code.first(3)}-#{Faker::Address.zip_code.last(4)}"}
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city_name { Faker::Address.city}
    address { Faker::Address.street_address}
    building_name { Faker::Address.street_address}
    tell_number { "0#{rand(1..9)}#{rand(10**8..10**9-1)}" }
    token { "tok_abcdefghijk00000000000000000"}
  end
end
