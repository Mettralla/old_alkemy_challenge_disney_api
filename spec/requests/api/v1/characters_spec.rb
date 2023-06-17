require 'rails_helper'

RSpec.describe 'Characters API', type: :request do
  before(:each) do
    @user = create(:user, email: 'toot@toot.com', password: 'g00d_pa$$')
    @genre = create(:genre)
    @movie = create(:movie)
    @character = create(:character)
    @headers = { 'Authorization' => JsonWebToken.encode(user_id: @user.id) }
    # @movie_lion_king = create(:movie, title: 'The Lion King', release_date: Date.new(1994, 6, 15),
    #     raiting: 8.5, genre_id: @genre.id, picture: 'the_lion_king.jpg')
    # @simba = create(:character, picture: 'simba.jpg', name: 'Simba', age: 2, weight: 50,
    #     story: 'Simba is the main protagonist of The Lion King', movie_id: @movie_lion_king.id)
    # @pumba = create(:character, picture: 'pumba.jpg', name: 'pumba', age: 20, weight: 150,
    #     story: 'Pumba is the lovely warhog of The Lion King', movie_id: @movie_lion_king.id)
  end

  describe 'GET /characters' do
    it 'should return all characters' do
      get api_v1_characters_path, headers: @headers

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(1)
      expect(response_body).to eq(
        [
          {
            'picture' => @character.picture,
            'name' => @character.name
          }
        ]
      )
    end

    it 'should not return all characters' do
      get api_v1_characters_path

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'GET /characters?search' do

    it 'filters characters by name' do
      get api_v1_characters_path, headers: @headers, params: { name: 'max' }

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(1)
      expect(response_body).to eq(character_index_expected_response(@character))
    end

    it 'filters characters by age' do
      get api_v1_characters_path, headers: @headers, params: { age: 18 }

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(1)
      expect(response_body).to eq(character_index_expected_response(@character))
    end

    it 'filters characters by movie' do
      get api_v1_characters_path, headers: @headers, params: { movie: @movie.id }

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(1)
      expect(response_body).to eq(character_index_expected_response(@character))
    end
  end

  describe 'GET /character/:id' do
    it 'should return a character' do
      get api_v1_character_path(@character), headers: @headers

      expect(response).to have_http_status(:ok)
      expect(response_body).to eq(build_character_expected_response(@character))
    end

    it 'should not return a character' do
      get api_v1_character_path(@character)

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'POST /characters' do
    let(:new_character_params) do
      {
        character: {
          picture: 'pj_pic.jpg',
          name: 'P.J.',
          age: 18,
          weight: 86.55,
          story: "Max's best friend since childhood.",
          movie_id: @movie.id
        }
      }
    end

    it 'should create a new character' do
      expect {
        post api_v1_characters_path, params: new_character_params, headers: @headers
      }.to change { Character.count }.from(1).to(2)

      expect(response).to have_http_status(:created)

      last_character = Character.last
      expect(response_body).to eq(build_character_expected_response(last_character))
    end

    it 'should not create a new character' do
      expect {
        post api_v1_characters_path, params: new_character_params
      }.to_not(change { Character.count })

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PATCH /character/:id' do
    it 'should update character' do
      patch api_v1_character_path(@character), params: { character: { name: 'Maximilian Goofy' } }, headers: @headers

      expect(response).to have_http_status(:ok)

      character_updated = Character.find(@character.id)
      expect(response_body).to eq(build_character_expected_response(character_updated))
    end

    it 'should not update character' do
      patch api_v1_character_path(@character), params: { character: { name: 'Maximilian Goofy' } }

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'DELETE /characters/:id' do
    it 'should delete a character' do
      expect {
        delete api_v1_character_path(@character), headers: @headers
      }.to change { Character.count }.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end

    it 'should not delete a character' do
      expect {
        delete api_v1_character_path(@character)
      }.to_not(change { Character.count })

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
