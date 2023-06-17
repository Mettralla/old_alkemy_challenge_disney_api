# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: %i[show update destroy]
      before_action :authenticate_user!, only: %i[index show create update destroy]

      def index
        @movies = Movie.all

        @movies = @movies.where('title ILIKE ?', "%#{params[:title]}%") if params[:title].present?
        @movies = @movies.where(genre_id: params[:genre_id]) if params[:genre_id].present?

        if params[:order] == 'ASC'
          @movies = @movies.order(release_date: :asc)
        elsif params[:order] == 'DESC'
          @movies = @movies.order(release_date: :desc)
        end

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
    end
  end
end
