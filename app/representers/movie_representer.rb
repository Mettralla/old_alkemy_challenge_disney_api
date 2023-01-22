class MovieRepresenter
  def initialize(movie)
    @movie = movie
  end

  def as_json
    {
      id: @movie.id,
      picture: @movie.picture,
      title: @movie.title,
      release_date: @movie.release_date,
      raiting: @movie.raiting,
      genre_id: @movie.genre.name,
      cast: @movie.characters.name
    }
  end

  private

  attr_reader :movies
end
