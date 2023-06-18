require 'rails_helper'

RSpec.describe "Movies API", type: :request do
  before(:each) do
    @user = create(:user, email: 'toot@toot.com', password: 'g00d_pa$$')
    @genre = create(:genre)
    @movie = create(:movie)
    @headers = { 'Authorization' => JsonWebToken.encode(user_id: @user.id) }
  end

  describe 'GET /movies' do
    it 'should return all movies' do
      get api_v1_movies_path, headers: @headers

      expect(response).to have_http_status(:ok)
      expect(response_body.size).to eq(1)
      expect(response_body).to eq(movie_index_expected_response(@movie))
    end

    it 'should return an empty array when there are no movies' do
      Movie.destroy_all
      get api_v1_movies_path, headers: @headers

      expect(response).to have_http_status(:success)
      expect(response_body).to eq([])
    end

    it 'should not be authorized to see all movies' do
      get api_v1_movies_path

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'GET /movies?search' do
    let!(:genre2) { create(:genre, id: 30, name: 'animation', picture: 'animation.jpg')}
    let!(:movie1) { create(:movie, id: 50, picture: 'movie_1.jpg', title: 'Movie 1', release_date: '2022-01-01', raiting:2, genre_id: @genre.id) }
    let!(:movie2) { create(:movie, id: 51, picture: 'movie_2.jpg', title: 'Movie 2', release_date: '2022-02-01', raiting:2, genre_id: genre2.id) }
    let!(:movie3) { create(:movie, id: 52, picture: 'movie_3.jpg', title: 'Movie 3', release_date: '2022-03-01', raiting:2, genre_id: @genre.id) }

    it 'filters movie by title' do
      get api_v1_movies_path, headers: @headers, params: { title: 'goofy' }

      expect(response).to have_http_status(:success)
      expect(response_body).to eq(movie_index_expected_response(@movie))
    end

    it 'filters movie by genre' do
      get api_v1_movies_path, headers: @headers, params: { genre_id: @genre.id }

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(3)
    end

    it 'returns movies in ascending order of release date' do
      get '/api/v1/movies', headers: @headers, params: { order: 'ASC' }

      expect(response).to have_http_status(:ok)
      expect(response_body.size).to eq(4)
      expect(response_body[0]['title']).to eq(@movie.title)
      expect(response_body[1]['title']).to eq('Movie 1')
      expect(response_body[2]['title']).to eq('Movie 2')
      expect(response_body[3]['title']).to eq('Movie 3')
    end

    it 'returns movies in descending order of release date' do
      get '/api/v1/movies', headers: @headers, params: { order: 'DESC' }

      expect(response).to have_http_status(:ok)
      expect(response_body.size).to eq(4)
      expect(response_body[0]['title']).to eq('Movie 3')
      expect(response_body[1]['title']).to eq('Movie 2')
      expect(response_body[2]['title']).to eq('Movie 1')
      expect(response_body[3]['title']).to eq(@movie.title)
    end
  end

  describe 'GET /movies/:id' do
    it 'should return movie details' do
      get api_v1_movie_path(@movie), headers: @headers

      expect(response).to have_http_status(:ok)
      expect(response_body).to eq(build_movie_expected_response(@movie))
    end

    it 'should return an empty list when the genre does not exist' do
      get api_v1_movie_path(666), headers: @headers

      expect(response).to have_http_status(:not_found)
      expect(response_body).to eq([])
    end

    it 'should not be authorized to see movie details' do
      get api_v1_movie_path(@movie)

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'POST /movies' do
    let(:new_movie_params) do
      {
        movie: {
          picture: 'red.jpg',
          title: 'Red',
          release_date: '01/03/2022',
          raiting: 5,
          genre_id: @genre.id
        }
      }
    end

    it 'should create a new movie' do
      expect {
        post api_v1_movies_path, params: new_movie_params, headers: @headers
      }.to change { Movie.count }.from(1).to(2)

      expect(response).to have_http_status(:created)

      last_movie = Movie.last
      expect(response_body).to eq(build_movie_expected_response(last_movie))
    end

    it 'should return :unprocessable_entity when character params are invalid' do
      invalid_params = {
        movie: {
          picture: 'red.jpg',
          title: 'Red',
          release_date: '01/03/2022',
          raiting: 11,
          genre_id: @genre.id
        }
      }

      post api_v1_movies_path, params: invalid_params, headers: @headers

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'should not be authorized to create a new movie' do
      expect {
        post api_v1_movies_path, params: new_movie_params
      }.to_not(change { Movie.count })

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PATCH /movies/:id' do
    it 'should update movie' do
      patch api_v1_movie_path(@movie), params: { movie: { title: 'Goofy 2: The Movie' } }, headers: @headers

      expect(response).to have_http_status(:ok)

      movie_updated = Movie.find(@movie.id)
      expect(response_body).to eq(build_movie_expected_response(movie_updated))
    end

    it 'should return :unprocessable_entity when movie params are invalid' do
      patch api_v1_movie_path(@movie), params: { movie: { genre_id: '' } }, headers: @headers

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'should not be authorized to update movie' do
      patch api_v1_movie_path(@movie), params: { movie: { title: 'Goofy 2: The Movie' } }

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'DELETE /movies/:id' do
    it 'should delete a movie' do
      expect {
        delete api_v1_movie_path(@movie), headers: @headers
      }.to change { Movie.count }.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end

    it 'should not delete a movie' do
      expect {
        delete api_v1_movie_path(@movie)
      }.to_not(change { Movie.count })

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
