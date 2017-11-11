class AuthenticationController < ApplicationController
  def create
    user = UserAuthenticator.call(params[:email], params[:password])
    if user
      subject_token = JsonWebTokenizer.encode({ sub: user.id })
      render json: { token: subject_token }
    else
      render json: { errors: ['Invalid email or password'] }
    end

  end
end
