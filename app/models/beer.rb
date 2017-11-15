class Beer < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
