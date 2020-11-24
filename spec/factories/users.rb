FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'a-z' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"契"}
    first_name            {"誓約"}
    family_name_kana      {"チカイ"}
    first_name_kana       {"セイヤク"}
    date_of_birth         {Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today)}
  end
end