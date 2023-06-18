class Api::V1::UsersController < ApplicationController
  include Authenticable
  before_action :set_user, only: %i[show update destroy]
  before_action :check_owner, only: %i[update destroy]

  # GET /users/@user.id
  def show
    render json: UserRepresenter.new(@user).as_json, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH /users/:id
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head 204
  end

  private

    # Only allow a trusted parameter 'white list' through
    def user_params
      params.require(:user).permit(:email, :password)
    end

    def set_user 
      @user = User.find(params[:id])
    end

    def check_owner
      head :forbidden unless @user.id == current_user&.id
    end
end
