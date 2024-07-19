FactoryBot.define do
  factory :category do
    name { "Example Category" }
    association :user
  end
end
