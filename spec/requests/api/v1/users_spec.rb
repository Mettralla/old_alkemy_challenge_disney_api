require 'rails_helper'

RSpec.describe "Users API", type: :request do
  before do
    @user = create(:user, email: 'toot@toot.com', password: 'g00d_pa$$')
  end

  describe "GET /users/:id" do
    it 'should show a user' do
      get api_v1_user_path(@user)
      expect(response).to have_http_status(:success)
      # Test response contains the correct email
      json_response = JSON.parse(response.body)
      expect(@user.email).to eq(json_response['email'])
    end
  end
end
