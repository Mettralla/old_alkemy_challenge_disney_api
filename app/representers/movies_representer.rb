class MoviesRepresenter
  def initialize(movies)
    @movies = movies
  end

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

  def release_date_format(movie)
    movie.release_date.strftime('%d/%m/%Y')
  end
end
