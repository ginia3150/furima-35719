FactoryBot.define do
  factory :user do
    n_name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    last_name             {"名前"}
    first_name            {"太朗"}
    last_name_kana        {"ナマエ"}
    first_name_kana       {"タロウ"}
    birthday              {'1996-01-01'}
  end
end