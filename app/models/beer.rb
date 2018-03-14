class Beer < ApplicationRecord
  has_many :comments, as: :commentable

  validates :name, presence: true, uniqueness: true
end
