# frozen_string_literal: true

module Api
  module V1
    # Controller for managing movie resources in the API.
    class MoviesController < ApplicationController
      before_action :set_movie, only: %i[show update destroy]
      before_action :authenticate_user!, only: %i[index show create update destroy]

      # GET /movies
      def index
        @movies = Movie.all

        # GET /movies?title=titulo
        @movies = filter_by_title(@movies) if params[:title].present?
        # GET /movies?genre_id=id_genero
        @movies = filter_by_genre(@movies) if params[:genre_id].present?
        # GET /movies?order=ASC || DESC
        @movies = order_by_release(@movies) if params[:order].present?

        render json: MoviesRepresenter.new(@movies).as_json, status: :ok
      end

      # GET /movies/:id
      def show
        render json: MovieRepresenter.new(@movie).as_json, status: :ok
      end

      # POST /movies
      def create
        @movie = Movie.new(movie_params)

        if @movie.save
          render json: MovieRepresenter.new(@movie).as_json, status: :created
        else
          render json: @movie.errors.full_messages, status: :unprocessable_entity
        end
      end

      # PATCH /movies/:id
      def update
        if @movie.update(movie_params)
          render json: MovieRepresenter.new(@movie).as_json, status: :ok
        else
          render json: @movie.errors.full_messages, status: :unprocessable_entity
        end
      end

      #  DELETE /movies/:id
      def destroy
        @movie.destroy

        head :no_content
      end

      private

      # Strong parameters for creating/updating a movie.
      def movie_params
        params.require(:movie).permit(:picture, :title, :release_date, :raiting, :genre_id)
      end

      # Sets the @movie instance variable based on the ID parameter.
      def set_movie
        @movie = Movie.find(params[:id])
      end

      # Filters movies by title.
      def filter_by_title(movies)
        movies.where('title ILIKE ?', "%#{params[:title]}%")
      end

      # Filters movies by genre.
      def filter_by_genre(movies)
        movies.where(genre_id: params[:genre_id])
      end

      # Orders movies by release date in ascending or descending order.
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
