class MoviesRepresenter
  def initialize(movies)
    @movies = movies
  end

  def as_json
    movies.map do |movie|
      {
        picture: movie.picture,
        title: movie.title,
        release_date: movie.release_date
      }
    end
  end

  private

  attr_reader :movies
end
