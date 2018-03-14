FactoryBot.define do
  factory :comment do
    content { Faker::Hipster.sentences(2) }
  end
end
