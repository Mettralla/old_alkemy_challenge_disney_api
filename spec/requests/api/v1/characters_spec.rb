require 'rails_helper'

RSpec.describe "Characters API", type: :request do
  before do
    @genre = create(:genre)
    @movie = create(:movie)
    @character = create(:character)
  end

  describe "GET /index" do
    it 'return all books' do
      get api_v1_characters_path

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end
end
