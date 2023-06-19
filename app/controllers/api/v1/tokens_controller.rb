# frozen_string_literal: true

module Api
  module V1
    # Controller for generating authentication tokens.
    class TokensController < ApplicationController
      # POST /tokens
      def create
        @user = User.find_by_email(user_params[:email])
        if @user&.authenticate(user_params[:password])
          render json: {
            token: JsonWebToken.encode(user_id: @user.id),
            email: @user.email
          }
        else
          render json: { error: 'Credenciales incorrectas' }, status: :unauthorized
        end
      end

      private

        # Strong parameters for creating/updating a user.
        def user_params
          params.require(:user).permit(:email, :password)
        end
    end
  end
end
