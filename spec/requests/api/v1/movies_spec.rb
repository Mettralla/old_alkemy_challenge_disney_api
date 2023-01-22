require 'rails_helper'

RSpec.describe "Movies API", type: :request do
  before do
    @genre = create(:genre)
    @movie = create(:movie)
    @character = create(:character)
  end

  describe 'GET /movies' do
    it 'return all characters' do
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
end
