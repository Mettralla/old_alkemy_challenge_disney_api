class ApplicationController < ActionController::API
  include Authenticable
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed


  private

  def not_destroyed(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

end
