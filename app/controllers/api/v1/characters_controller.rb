# frozen_string_literal: true

module Api
  module V1
    class CharactersController < ApplicationController
      before_action :set_character, only: %i[show update destroy]
      before_action :authenticate_user!, only: %i[index show create update destroy]

      def index
        @characters = Character.all

        @characters.where('name ILIKE ?', "%#{params[:name]}%") if params[:name].present?
        @characters.where(age: params[:age]) if params[:age].present?
        @characters.where(movie_id: params[:movie_id]) if params[:movie_id].present?

        render json: CharactersRepresenter.new(@characters).as_json
      end

      def show
        render json: CharacterRepresenter.new(@character).as_json
      end

      def create
        @character = Character.new(character_params)

        if @character.save
          render json: CharacterRepresenter.new(@character).as_json, status: :created
        else
          render json: @character.errors.full_messages, status: :unprocessable_entity
        end
      end

      def update
        if @character.update(character_params)
          render json: CharacterRepresenter.new(@character).as_json, status: :ok
        else
          render json: @character.errors.full_messages, status: :unprocessable_entity
        end
      end

      def destroy
        @character.destroy

        head :no_content
      end

      private

      def character_params
        params.require(:character).permit(:picture, :name, :age, :weight, :story, :movie_id)
      end

      def set_character
        @character = Character.find(params[:id])
      end

      def filter_by_name(characters)
        characters.where('name ILIKE ?', "%#{params[:name]}%") if params[:name].present?
      end

      def filter_by_age(characters)
        characters.where(age: params[:age]) if params[:age].present?
      end

      def filter_by_movies(characters)
        characters.where(movie_id: params[:movie_id]) if params[:movie_id].present?
      end
    end
  end
end
