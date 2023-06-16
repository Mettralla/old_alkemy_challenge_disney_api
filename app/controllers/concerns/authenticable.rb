module Authenticable 
  def current_user
    return @current_user if @current_user

    header = request.headers['Authorization']
    return nil if header.nil?

    decoded = JsonWebToken.decode(header)

    @current_user = User.find(decoded[:user_id]) rescue ActiveRecord::RecordNotFound
  end

  # def authenticate_user!
  #   # Verifica si el usuario está autenticado
  #   unless current_user
  #     render json: { error: 'Acceso no autorizado' }, status: :unauthorized
  #   end
  # end
end