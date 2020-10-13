FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name1 {"山田"}
    last_name1 {"太郎"}
    first_name2 {"ヤマダ"}
    last_name2 {"タロウ"}
    birthday {"2000-01-01"}
  end
end