FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    family_name           { "山田" }
    first_name            { "太ろウ" }
    family_name_kana      { "ヤマダ" }
    first_name_kana       { "タロウ" }
    birthday              { Faker::Date.backward }
  end
end
