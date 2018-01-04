class Api::V1::AuthenticationController < ApplicationController
  def create
    user = UserAuthenticator.call(auth_params[:email], auth_params[:password])

    if user.present?
      @subject_token = JsonWebTokenizer.encode({ sub: user.id })
      render json: { token: @subject_token }, status: :created
    else
      render json: { errors: [ 'Invalid email or password' ] }, status: :unauthorized
    end
  end

  private
    def auth_params
      params.require(:data).require(:attributes).permit(:email, :password)
    end
end
