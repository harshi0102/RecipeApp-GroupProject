require 'rails_helper'

RSpec.describe 'PublicRecipes', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /index' do
    before(:each) do
      user = User.create(email: 'user@example.com', password: 'password')
      login_as(user, scope: :user)
      get '/recipes'
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end
  end
end
