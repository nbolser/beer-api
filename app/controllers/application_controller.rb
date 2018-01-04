class ApplicationController < ActionController::Base
  include ActionController::MimeResponds
  protect_from_forgery with: :null_session

  private
    def token
      @token ||= request.headers.fetch('Authorization', '').split(' ').last
    end

    def authenticate_token
      payload = JsonWebTokenizer.decode(token)
      if payload.present?
        @current_user ||= User.find_by(id: payload[:sub])
      else
        render json: { errors: ['Invalid token'] }, status: :unauthorized
      end
    end
end
