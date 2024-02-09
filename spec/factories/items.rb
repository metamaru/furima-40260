FactoryBot.define do
  factory :item do
    item_name             { Faker::Name.initials }
    item_detail           { Faker::Lorem.sentence }
    category_id           { Faker::Number.between(from: 2, to: 11) }
    product_condition_id  { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id    { Faker::Number.between(from: 2, to: 3) }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    delivery_day_id       { Faker::Number.between(from: 2, to: 4) }
    item_price            { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.jpg'), filename: 'sample.jpg')
    end
  end
end
