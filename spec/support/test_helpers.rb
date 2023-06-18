# spec/support/test_helpers.rb

module TestHelpers
  def build_character_expected_response(character)
    {
      'id' => character.id,
      'picture' => character.picture,
      'name' => character.name,
      'age' => character.age,
      'weight' => character.weight,
      'story' => character.story,
      'movies' => character.movie.title
    }
  end

  def character_index_expected_response(character)
    [
      {
        'picture' => character.picture,
        'name' => character.name
      }
    ]
  end

  def build_movie_expected_response(movie)
    {
      'id' => movie.id,
      'picture' => movie.picture,
      'title' => movie.title,
      'release_date' => movie.release_date.strftime('%d/%m/%Y'),
      'raiting' => movie.raiting,
      'genre_id' => movie.genre.name,
      'cast' => movie.characters.as_json
    }
  end

  def movie_index_expected_response(movie)
    [
      {
        'picture' => movie.picture,
        'title' => movie.title,
        'release_date' => movie.release_date.strftime('%d/%m/%Y')
      }
    ]
  end

  def genres_index_expected_response(genres)
    genres.map do |genre|
      {
        'name' => genre.name,
        'picture' => genre.picture
      }
    end
  end

  def build_genre_expected_response(genre)
    {
      'id' => genre.id,
      'name' => genre.name,
      'picture' => genre.picture
    }
  end
end
