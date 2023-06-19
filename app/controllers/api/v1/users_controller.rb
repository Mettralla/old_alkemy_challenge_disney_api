# frozen_string_literal: true

module Api
  module V1
    # Controller for managing user resources in the API.
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]
      before_action :check_owner, only: %i[update destroy]

      # GET /users/:id
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

        # Strong parameters for creating/updating a user.
        def user_params
          params.require(:user).permit(:email, :password)
        end

        # Sets the user based on the provided ID.
        def set_user 
          @user = User.find(params[:id])
        end

        # Checks if the current user is the owner of the user being accessed.
        def check_owner
          head :forbidden unless @user.id == current_user&.id
        end
    end
  end
end