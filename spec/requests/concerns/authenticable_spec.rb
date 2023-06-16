require 'rails_helper'

class MockController
  include Authenticable
  attr_accessor :request

  def initialize
    mock_request = Struct.new(:headers)
    self.request = mock_request.new({})
  end
end

RSpec.describe 'Authentication', type: :request do
  before do
    @user = create(:user, email: 'toot@toot.com', password: 'g00d_pa$$')
    @authentication = MockController.new
  end

  describe "Authorization Token" do
    it 'should get user from Authorization token' do
      @authentication.request.headers['Authorization'] = JsonWebToken.encode(user_id: @user.id)

      expect(@authentication.current_user).not_to be_nil
      expect(@user.id).to eq(@authentication.current_user.id)
    end

    it 'should not get user from empty Authorization token' do
      @authentication.request.headers['Authorization'] = nil
      expect(@authentication.current_user).to be_nil
    end


  end
  
end
