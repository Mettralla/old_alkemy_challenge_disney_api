# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: %i[show update destroy]
      before_action :authenticate_user!, only: %i[index show create update destroy]

      def index
        @movies = Movie.all

        @movies = filter_by_title(@movies) if params[:title].present?
        @movies = filter_by_genre(@movies) if params[:genre_id].present?
        @movies = order_by_release(@movies) if params[:order].present?

        render json: MoviesRepresenter.new(@movies).as_json, status: :ok
      end

      def show
        render json: MovieRepresenter.new(@movie).as_json, status: :ok
      end

      def create
        @movie = Movie.new(movie_params)

        if @movie.save
          render json: MovieRepresenter.new(@movie).as_json, status: :created
        else
          render json: @movie.errors.full_messages, status: :unprocessable_entity
        end
      end

      def update
        if @movie.update(movie_params)
          render json: MovieRepresenter.new(@movie).as_json, status: :ok
        else
          render json: @movie.errors.full_messages, status: :unprocessable_entity
        end
      end

      def destroy
        @movie.destroy

        head :no_content
      end

      private

      def movie_params
        params.require(:movie).permit(:picture, :title, :release_date, :raiting, :genre_id)
      end

      def set_movie
        @movie = Movie.find(params[:id])
      end

      def filter_by_title(movies)
        movies.where('title ILIKE ?', "%#{params[:title]}%")
      end

      def filter_by_genre(movies)
        movies.where(genre_id: params[:genre_id])
      end

      def order_by_release(movies)
        order = params[:order]

        case order
        when 'ASC'
          movies.order(release_date: :asc)
        when 'DESC'
          movies.order(release_date: :desc)
        else
          movies
        end
      end
    end
  end
end
