class BeerSerializer < ActiveModel::Serializer
  attributes :id, :name, :style, :yeast, :hop, :malts, :ibu, :alcohol, :blg, :created_at, :updated_at
end
