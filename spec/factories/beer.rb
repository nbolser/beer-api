FactoryBot.define do
  factory :beer do
    sequence(:name) { |n| "#{Faker::Beer.name} #{n}"  }
    style { Faker::Beer.style }
    yeast { Faker::Beer.yeast }
    hop { Faker::Beer.hop }
    malts { Faker::Beer.malts }
    ibu { Faker::Beer.ibu }
    alcohol { Faker::Beer.alcohol }
    blg { Faker::Beer.blg }

    trait :with_comment do
      before(:create) do |shop|
        create(:comment, owner: shop)
      end
      after(:build) do |shop|
        build(:comment, owner: shop)
      end
    end
  end
end
