# frozen_string_literal: true

module Api
  module V1
    class GenresController < ApplicationController
      before_action :set_genre, only: %i[show update destroy]
      before_action :authenticate_user!, only: %i[index show create update destroy]

      def index
        @genres = Genre.all

        render json: GenresRepresenter.new(@genres).as_json
      end

      def show
        render json: GenreRepresenter.new(@genre).as_json
      end

      def create
        @genre = Genre.new(genre_params)

        if @genre.save
          render json: GenreRepresenter.new(@genre).as_json, status: :created
        else
          render json: @genre.errors.full_messages, status: :unprocessable_entity
        end
      end

      def update
        if @genre.update(genre_params)
          render json: GenreRepresenter.new(@genre).as_json, status: :ok
        else
          render json: @genre.errors.full_messages, status: :unprocessable_entity
        end
      end

      def destroy
        @genre.destroy

        head :no_content
      end

      private

      def genre_params
        params.require(:genre).permit(:name, :picture)
      end

      def set_genre
        @genre = Genre.find(params[:id])
      end
    end
  end
end
