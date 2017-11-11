class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, case_sensitive: false
  validates :password, length: { minimum: 8 }, allow_nil: false, on: :create
end
