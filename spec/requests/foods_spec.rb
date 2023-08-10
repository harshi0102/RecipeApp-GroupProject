require 'rails_helper'

RSpec.describe '/foods', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'luis', email: 'example@email.com', password: 'password')
      @food = Food.create(name: 'food', measurement_unit: 'grams', price: 3, quantity: 2, user_id: @user.id)
      sign_in(@user)
      get foods_path
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders a list of foods including food name' do
      expect(response.body).to include('food')
    end
  end
end
