class ApplicationController < ActionController::API
  include Authenticable
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  # Renders an error response for an ActiveRecord record that failed to be destroyed.
  def not_destroyed(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  # Renders a not found response.
  def not_found
    render json: [], status: :not_found
  end
end
