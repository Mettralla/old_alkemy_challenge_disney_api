require 'rails_helper'

RSpec.describe "Movies API", type: :request do
  before do
    @genre = create(:genre)
    @movie = create(:movie)
    @character = create(:character)
  end

  describe 'GET /movies' do
    it 'return all movies' do
      get api_v1_movies_path

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(1)
      expect(response_body).to eq(
        [
          {
            'picture' => @movie.picture,
            'title' => @movie.title,
            'release_date' => @movie.release_date.strftime('%d/%m/%Y')
          }
        ]
      )
    end
  end

  describe 'GET /movie' do
    it 'return movie details' do
      get api_v1_movie_path(@movie)

      expect(response).to have_http_status(:ok)
      expect(response_body).to eq(
        {
          'id' => @movie.id,
          'picture' => @movie.picture,
          'title' => @movie.title,
          'release_date' => @movie.release_date.strftime('%d/%m/%Y'),
          'raiting' => @movie.raiting,
          'genre_id' => @movie.genre.name,
          'cast' => @movie.characters.as_json
        }
      )
    end
  end
end
