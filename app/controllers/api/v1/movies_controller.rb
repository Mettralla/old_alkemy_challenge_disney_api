# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: %i[show update destroy]

      def index
        @characters = Character.all

        render json: MoviesRepresenter.new(@characters).as_json
      end

      private

      def movie_params
        params.require(:movie).permit(:picture, :title, :release_date, :raiting, :genre_id)
      end

      def set_movie
        @movie = Movie.find(params[:id])
      end
    end
  end
end
