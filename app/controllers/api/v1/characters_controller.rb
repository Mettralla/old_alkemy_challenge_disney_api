# frozen_string_literal: true

module Api
  module V1
    # Controller for managing character resources in the API.
    class CharactersController < ApplicationController
      before_action :set_character, only: %i[show update destroy]
      before_action :authenticate_user!, only: %i[index show create update destroy]

      # GET /characters
      def index
        @characters = Character.all

        # GET /characters?name=nombre
        @characters = filter_by_name(@characters) if params[:name].present?
        # GET /characters?age=edad
        @characters = filter_by_age(@characters) if params[:age].present?
        # GET /characters?movie_id=id_pelicula
        @characters = filter_by_movies(@characters) if params[:movie_id].present?

        render json: CharactersRepresenter.new(@characters).as_json
      end

      # GET /characters/:id
      def show
        render json: CharacterRepresenter.new(@character).as_json
      end

      # POST /characters
      def create
        @character = Character.new(character_params)

        if @character.save
          render json: CharacterRepresenter.new(@character).as_json, status: :created
        else
          render json: @character.errors.full_messages, status: :unprocessable_entity
        end
      end

      # PATCH /characters/:id
      def update
        if @character.update(character_params)
          render json: CharacterRepresenter.new(@character).as_json, status: :ok
        else
          render json: @character.errors.full_messages, status: :unprocessable_entity
        end
      end

      # DELETE /characters/:id
      def destroy
        @character.destroy

        head :no_content
      end

      private

        # Strong parameters for creating/updating a character.
        def character_params
          params.require(:character).permit(:picture, :name, :age, :weight, :story, :movie_id)
        end

        # Sets the @character instance variable based on the ID parameter.
        def set_character
          @character = Character.find(params[:id])
        end

        # Filters characters by name.
        def filter_by_name(characters)
          characters.where('name ILIKE ?', "%#{params[:name]}%")
        end

        # Filters characters by age.
        def filter_by_age(characters)
          characters.where(age: params[:age])
        end

        # Filters characters by movie.
        def filter_by_movies(characters)
          characters.where(movie_id: params[:movie_id])
        end
    end
  end
end
