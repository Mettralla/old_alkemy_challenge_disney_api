require 'rails_helper'

RSpec.describe "Users API", type: :request do
  before do
    @user = create(:user, email: 'toot@toot.com', password: 'g00d_pa$$')
    @headers = { Authorization: JsonWebToken.encode(user_id: @user.id) }
  end

  describe 'GET /users/:id' do
    it 'should show a user' do
      get api_v1_user_path(@user)
      expect(response).to have_http_status(:success)

      expect(response_body).to eq(build_user_expected_response(@user))
    end
  end

  describe 'POST /users' do
    it 'should create user ' do
      expect {
        post api_v1_users_path, params: { user: { email: 'test1@test1.com', password: 'testPassword123' } }, as: :json
      }.to change { User.count }.from(1).to(2)
      expect(response).to have_http_status(:created)
    end

    it 'should not create user with taken email' do
      expect {
        post api_v1_users_path, params: { user: { email: 'toot@toot.com', password: 'trustno1' } }, as: :json
      }.to_not(change { User.count })

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH /users/:id' do
    it 'should update user' do
      patch api_v1_user_path(@user), params: { user: { email: 'toot@toot.com' } }, headers: @headers

      expect(response).to have_http_status(:ok)
    end

    it 'should forbid update user' do
      patch api_v1_user_path(@user), params: { user: { email: @user.email } }, as: :json

      expect(response).to have_http_status(:forbidden)
    end
  end

  describe 'DELETE /users/:id' do
    it 'should destroy user' do
      expect {
        delete api_v1_user_path(@user), headers: @headers
      }.to change { User.count }.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end

    it 'should forbid destroy user' do
      expect {
        delete api_v1_user_path(@user), as: :json
      }.to_not(change { User.count })

      expect(response).to have_http_status(:forbidden)
    end
  end
end
