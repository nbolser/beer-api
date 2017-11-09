FactoryBot.define do
  factory :beer do
    name { Faker::Beer.name }
    style { Faker::Beer.style }
    yeast { Faker::Beer.yeast }
    hop { Faker::Beer.hop }
    malts { Faker::Beer.malts }
    ibu { Faker::Beer.ibu }
    alcohol { Faker::Beer.alcohol }
    blg { Faker::Beer.blg }
  end
end
