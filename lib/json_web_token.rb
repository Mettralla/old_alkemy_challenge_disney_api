# frozen_string_literal: true

# Helper class for encoding and decoding JSON Web Tokens (JWT).
class JsonWebToken
  # The secret key used for encoding and decoding JWTs.
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  # Encodes the given payload into a JWT.
  #
  # Parameters:
  # - payload (Hash): The payload to be encoded.
  # - exp (Time): The expiration time for the token (default: 24 hours from now).
  #
  # Returns:
  # - String: The encoded JWT.
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  # Decodes the given JWT and returns the decoded payload as a Hash with indifferent access.
  #
  # Parameters:
  # - token (String): The JWT to be decoded.
  #
  # Returns:
  # - HashWithIndifferentAccess: The decoded payload.
  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY).first
    HashWithIndifferentAccess.new decoded
  end
end
