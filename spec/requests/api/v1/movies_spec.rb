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

  describe 'GET /movies' do
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

  describe 'POST /movies' do
    it 'should create a new movie' do
      expect {
        post api_v1_movies_path,
        params: {
          movie: {
            picture: 'f5d6a7654dsa.jpg',
            title: 'Red',
            release_date: '01/03/2022',
            raiting: 5,
            genre_id: 1
          }
        }
      }.to change { Movie.count }.from(1).to(2)

      expect(response).to have_http_status(:created)
      expect(response_body).to eq(
        {
          'id' => @genre.movies.last.id,
          'picture' => @genre.movies.last.picture,
          'title' => @genre.movies.last.title,
          'release_date' => @genre.movies.last.release_date.strftime('%d/%m/%Y'),
          'raiting' => @genre.movies.last.raiting,
          'genre_id' => @genre.movies.last.genre.name,
          'cast' => @genre.movies.last.characters.as_json
        }
      )
    end
  end

  describe 'PATCH /movies/:id' do
    it 'should update movie' do
      patch api_v1_movie_path(@movie), params: { movie: { title: 'Goofy 2: The Movie' } }

      expect(response).to have_http_status(:ok)
      expect(response_body).to eq(
        {
          'id' => @movie.id,
          'picture' => @movie.picture,
          'title' => 'Goofy 2: The Movie',
          'release_date' => @movie.release_date.strftime('%d/%m/%Y'),
          'raiting' => @movie.raiting,
          'genre_id' => @movie.genre.name,
          'cast' => @movie.characters.as_json
        }
      )
    end
  end

  describe 'DELETE /movies/:id' do
    it 'delete a movie' do
      expect {
        delete api_v1_movie_path(@movie)
      }.to change { Movie.count }.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end
  end
end
