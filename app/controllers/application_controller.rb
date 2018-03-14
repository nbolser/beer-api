class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def require_authentication
    authenticate_token
  end

  protected

  def render_unauthorized
    head :unauthorized
  end

  private

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      payload = JsonWebTokenizer.decode(token)
      User.find_by(id: payload['sub']) if payload.present?
    end
  end
end
