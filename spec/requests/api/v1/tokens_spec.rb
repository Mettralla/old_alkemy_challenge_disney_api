require 'rails_helper'

RSpec.describe "Token API", type: :request do
  before do
    @user = FactoryBot.create(:user, email: 'toot@toot.com', password: 'g00d_pa$$')
  end

  describe "POST /create" do
    it "should get JWT token" do
      post api_v1_tokens_path, params: { user: { email: @user.email, password: 'g00d_pa$$' } }, as: :json

      expect(response).to have_http_status(:success)
      
      json_response = JSON.parse(response.body)
      expect(json_response['token']).not_to be_nil
    end

    it "should not get JWT token" do
      post api_v1_tokens_path, params: { user: { email: @user.email, password: 'b4dpa$$' } }, as: :json
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
