require 'rails_helper'

RSpec.describe "Genres API", type: :request do
  before(:each) do
    @user = create(:user, email: 'toot@toot.com', password: 'g00d_pa$$')
    @genre = create(:genre)
    @headers = { 'Authorization' => JsonWebToken.encode(user_id: @user.id) }
  end

  describe 'GET /genres' do
    let!(:animation) { create(:genre, id: 30, name: 'animation', picture: 'animation.jpg')}

    it 'should return all genres' do
      get api_v1_genres_path, headers: @headers

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(2)

      genres_in_index = [@genre, animation]
      expect(response_body).to eq(genres_index_expected_response(genres_in_index))
    end

    it 'should not be authorized to see all genres' do
      get api_v1_genres_path

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'GET /genres/:id' do
    it 'should return genre details' do
      get api_v1_genre_path(@genre), headers: @headers

      expect(response).to have_http_status(:ok)
      expect(response_body).to eq(build_genre_expected_response(@genre))
    end

    it 'should not be authorized to see genre details' do
      get api_v1_genre_path(@genre)

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'POST /genres' do
    let(:new_genre_params) { { genre: { picture: 'family.jpg', name: 'family' } } }

    it 'should create a new genre' do
      expect {
        post api_v1_genres_path, params: new_genre_params, headers: @headers
      }.to change { Genre.count }.from(1).to(2)

      expect(response).to have_http_status(:created)

      last_character = Genre.last
      expect(response_body).to eq(build_genre_expected_response(last_character))
    end

    it 'should not be authorized to create a new genre' do
      expect {
        post api_v1_genres_path, params: new_genre_params
      }.to_not(change { Genre.count })

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PATCH /genres/:id' do
    it 'should update genre' do
      patch api_v1_genre_path(@genre), params: { genre: { picture: 'comedy.jpg' } }, headers: @headers

      expect(response).to have_http_status(:ok)

      genre_updated = Genre.find(@genre.id)
      expect(response_body).to eq(build_genre_expected_response(genre_updated))
    end

    it 'should not be authorized to update character' do
      patch api_v1_genre_path(@genre), params: { genre: { picture: 'comedy.jpg' } }

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'DELETE /genres/:id' do
    it 'should delete a genre' do
      expect {
        delete api_v1_genre_path(@genre), headers: @headers
      }.to change { Genre.count }.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end

    it 'should not be authorized to delete a genre' do
      expect {
        delete api_v1_genre_path(@genre)
      }.to_not(change { Genre.count })

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
