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

  describe 'POST /users' do
    it "should create user" do
      expect {
        post api_v1_users_path, params: { user: { email: 'test1@test1.com', password: 'testPassword123' } }, as: :json
      }.to change { User.count }.from(1).to(2)
      expect(response).to have_http_status(:created)
    end

    it "should not create user with taken email" do
      expect {
        post api_v1_users_path, params: { user: { email: 'toot@toot.com', password: 'trustno1' } }, as: :json
      }.not_to change { User.count }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PATCH /users/:id" do
    it "should update user" do
      patch api_v1_user_path(@user), params: { user: { email: 'tuut@tuut.com' } }, as: :json

      expect(response).to have_http_status(:success)
    end

    it "should not update user when invalid params are sent" do
      patch api_v1_user_path(@user), params: { user: { email: 'bad_email', password: '123456' } }, as: :json

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
