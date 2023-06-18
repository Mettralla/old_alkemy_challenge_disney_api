class ApplicationController < ActionController::API
  include Authenticable
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  # Renderiza los errores si no se destruye el registro
  def not_destroyed(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  # Renderiza una lista vacia si no se encuentra el registro
  def not_found
    render json: [], status: :not_found
  end
end
