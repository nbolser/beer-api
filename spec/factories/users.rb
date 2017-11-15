FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'

    trait :default do
      email 'user@foo.com'
    end
  end
end
