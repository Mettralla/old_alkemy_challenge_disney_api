# frozen_string_literal: true

module Api
  module V1
    # Controller for managing genre resources in the API.
    class GenresController < ApplicationController
      before_action :set_genre, only: %i[show update destroy]
      before_action :authenticate_user!, only: %i[index show create update destroy]

      # GET /genres
      def index
        @genres = Genre.all

        render json: GenresRepresenter.new(@genres).as_json
      end

      # GET /genres/:id
      def show
        render json: GenreRepresenter.new(@genre).as_json
      end

      # POST /genres
      def create
        @genre = Genre.new(genre_params)

        if @genre.save
          render json: GenreRepresenter.new(@genre).as_json, status: :created
        else
          render json: @genre.errors.full_messages, status: :unprocessable_entity
        end
      end

      # PATCH /genres/:id
      def update
        if @genre.update(genre_params)
          render json: GenreRepresenter.new(@genre).as_json, status: :ok
        else
          render json: @genre.errors.full_messages, status: :unprocessable_entity
        end
      end

      # DELETE /genres/:id
      def destroy
        @genre.destroy

        head :no_content
      end

      private

      # Strong parameters for creating/updating a genre.
      def genre_params
        params.require(:genre).permit(:name, :picture)
      end

      # Sets the @genre instance variable based on the ID parameter.
      def set_genre
        @genre = Genre.find(params[:id])
      end
    end
  end
end
