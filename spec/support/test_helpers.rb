# frozen_string_literal: true

# spec/support/test_helpers.rb

# Module containing helper methods for test scenarios
module TestHelpers
  # Builds the expected response for a character object
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

  # Builds the expected response for character index action
  def character_index_expected_response(character)
    [
      {
        'picture' => character.picture,
        'name' => character.name
      }
    ]
  end

  # Builds the expected response for a movie object
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

  # Builds the expected response for movie index action
  def movie_index_expected_response(movie)
    [
      {
        'picture' => movie.picture,
        'title' => movie.title,
        'release_date' => movie.release_date.strftime('%d/%m/%Y')
      }
    ]
  end

  # Builds the expected response for genres index action
  def genres_index_expected_response(genres)
    genres.map do |genre|
      {
        'name' => genre.name,
        'picture' => genre.picture
      }
    end
  end

  # Builds the expected response for a genre object
  def build_genre_expected_response(genre)
    {
      'id' => genre.id,
      'name' => genre.name,
      'picture' => genre.picture
    }
  end

  # Builds the expected response for a user object
  def build_user_expected_response(user)
    {
      'id' => user.id,
      'email' => user.email
    }
  end
end
