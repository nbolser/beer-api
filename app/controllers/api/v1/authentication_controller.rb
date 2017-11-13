class Api::V1::AuthenticationController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def create
    user = UserAuthenticator.call(params[:email], params[:password])

    if user.present?
      subject_token = JsonWebTokenizer.encode({ sub: user.id })
      render json: subject_token, each_serializer: TokenSerializer
    else
      render json: { errors: ['Invalid email or password'] }, status: :unauthorized
    end
  end
end
