# frozen_string_literal: true

# MoviesRepresenter is responsible for representing a collection of Movie objects as JSON.
class MoviesRepresenter
  # Initializes a new instance of MoviesRepresenter.
  def initialize(movies)
    @movies = movies
  end

  # Converts the collection of Movie objects to a JSON representation.
  def as_json
    movies.map do |movie|
      {
        picture: movie.picture,
        title: movie.title,
        release_date: release_date_format(movie)
      }
    end
  end

  private

  attr_reader :movies

  # Formats the release date of a Movie object to the specified format.
  def release_date_format(movie)
    movie.release_date.strftime('%d/%m/%Y')
  end
end
