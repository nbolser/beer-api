class JsonWebTokenizer
  class << self
    def encode(payload)
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      begin
        JWT.decode(token, Rails.application.secrets.secret_key_base).first
      rescue JWT::DecodeError, JWT::VerificationError => e
        raise #{e.message}
      end
    end
  end
end
