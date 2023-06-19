# frozen_string_literal: true

# This module provides authentication methods for controllers.
module Authenticable
  # Retrieves the current authenticated user based on the Authorization header.
  def current_user
    return @current_user if @current_user

    header = request.headers['Authorization']
    return nil if header.nil?

    decoded = JsonWebToken.decode(header)

    @current_user = User.find(decoded[:user_id]) rescue ActiveRecord::RecordNotFound
  end

  # Authenticates the user and ensures that there is a current user.
  def authenticate_user!
    unless current_user
      render json: { error: 'Acceso no autorizado' }, status: :unauthorized
    end
  end
end
