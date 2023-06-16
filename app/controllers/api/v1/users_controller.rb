class Api::V1::UsersController < ApplicationController

  # GET /users/@user.id
  def show
    render json: User.find(params[:id])
  end

end
