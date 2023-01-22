require 'rails_helper'

RSpec.describe "Characters API", type: :request do
  before do
    @genre = create(:genre)
    @movie = create(:movie)
    @character = create(:character)
  end

  describe 'GET /characters' do
    it 'return all characters' do
      get api_v1_characters_path

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
  end

  describe 'GET /character/:id' do
    it 'return character' do
      get api_v1_character_path(@character)

      expect(response).to have_http_status(:ok)
      expect(response_body).to eq(
        {
          'id' => @character.id,
          'picture' => @character.picture,
          'name' => @character.name,
          'age' => @character.age,
          'weight' => @character.weight,
          'story' => @character.story,
          'movies' => @character.movie.title
        }
      )
    end
  end

  describe 'POST /characters' do
    it 'create a new book' do
      expect {
        post api_v1_characters_path,
        params: { 
          character: {
            picture: 'adg4567wadg54.jpg',
            name: 'P.J.',
            age: 18,
            weight: 86.55,
            story: "Max's best friend since childhood.",
            movie_id: @movie.id
          }
        }
      }.to change { Character.count }.from(1).to(2)

      expect(response).to have_http_status(:created)
      expect(response_body).to eq(
        {
          'id' => @movie.characters.last.id,
          'picture' => @movie.characters.last.picture,
          'name' => @movie.characters.last.name,
          'age' => @movie.characters.last.age,
          'weight' => @movie.characters.last.weight,
          'story' => @movie.characters.last.story,
          'movies' => @movie.title
        }
      )
    end
  end

  describe 'PATCH /character/:id' do
    it 'should update character' do
      patch api_v1_character_path(@character), params: { character: { name: 'Maximilian Goofy' } }

      expect(response).to have_http_status(:ok)
      expect(response_body).to eq(
        {
          'id' => @character.id,
          'picture' => @character.picture,
          'name' => 'Maximilian Goofy',
          'age' => @character.age,
          'weight' => @character.weight,
          'story' => @character.story,
          'movies' => @character.movie.title
        }
      )
    end
  end

  describe 'DELETE /characters/:id' do
    it 'delete a character' do
      expect {
        delete api_v1_character_path(@character)
      }.to change { Character.count }.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end
  end
end
