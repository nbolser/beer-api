class UserAuthenticator
  attr_accessor :email, :password, :user

  def self.call(email, password)
    new(email: email, password: password).call
  end

  def initialize(email: email, password: password)
    @email = email
    @password = password
  end

  def call
    authenticate_user_password
  end

  private
    def user
      @user ||= User.find_by(email: email)
    end

    def authenticate_user_password
      return user if user && user.authenticate(password)
    end
end
