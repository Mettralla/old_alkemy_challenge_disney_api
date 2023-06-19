# frozen_string_literal: true

# MovieRepresenter is responsible for representing a Movie object as JSON.
class MovieRepresenter
  # Initializes a new instance of MovieRepresenter.
  def initialize(movie)
    @movie = movie
  end

  # Converts the Movie object to a JSON hash representation.
  def as_json
    {
      id: @movie.id,
      picture: @movie.picture,
      title: @movie.title,
      release_date: @movie.release_date.strftime('%d/%m/%Y'),
      raiting: @movie.raiting,
      genre_id: @movie.genre.name,
      cast: @movie.characters
    }
  end

  private

  attr_reader :movies
end
