class JsonWebTokenizer
  class << self
    def encode(payload)
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      JWT.decode(token, Rails.application.secrets.secret_key_base).first
    end
  end
end
