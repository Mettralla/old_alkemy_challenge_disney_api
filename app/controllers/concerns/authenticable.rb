# frozen_string_literal: true

# Módulo para funcionalidades relacionadas con la autenticación.
module Authenticable
  # Obtiene el usuario actual basado en el encabezado de autorización.
  #
  # Return:
  #   - El usuario actual si está autenticado.
  #   - `nil` si el encabezado de autorización está ausente o no es válido.
  #   - Lanza `ActiveRecord::RecordNotFound` si no se puede encontrar el usuario.
  def current_user
    return @current_user if @current_user

    header = request.headers['Authorization']
    return nil if header.nil?

    decoded = JsonWebToken.decode(header)

    @current_user = User.find(decoded[:user_id]) rescue ActiveRecord::RecordNotFound
  end

  # Autentica al usuario verificando si ha iniciado sesión.
  # Renderiza una respuesta de error en formato JSON con el estado :unauthorized si el usuario no está autenticado.
  def authenticate_user!
    unless current_user
      render json: { error: 'Acceso no autorizado' }, status: :unauthorized
    end
  end
end
