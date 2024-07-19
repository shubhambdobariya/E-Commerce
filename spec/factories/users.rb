FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    admin { false }
  end
end
  