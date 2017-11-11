FactoryBot.define do
  factory :user do
    email 'user@foo.com'
    password 'password'
    password_confirmation 'password'
  end
end
