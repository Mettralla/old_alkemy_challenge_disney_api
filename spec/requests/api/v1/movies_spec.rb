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

    it 'should not return all movies' do
      get api_v1_movies_path

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'GET /movies/:id' do
    it 'should return movie details' do
      get api_v1_movie_path(@movie), headers: @headers

      expect(response).to have_http_status(:ok)
      expect(response_body).to eq(build_movie_expected_response(@movie))
    end

    it 'should not return movie details' do
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

    it 'should not create a new movie' do
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

    it 'should not update movie' do
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
