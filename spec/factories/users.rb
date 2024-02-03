FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.email }
    password              { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { person.family.kanji }
    first_name            { person.first.kanji }
    family_name_kana      { person.family.katakana }
    first_name_kana       { person.first.katakana }
    birthday              { Faker::Date.backward }
  end
end
