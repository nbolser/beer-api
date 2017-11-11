class UsersController < ApplicationController
  before_save :downcase_email

  private

  def downcase_email
    request[:email].downcase
  end
end
