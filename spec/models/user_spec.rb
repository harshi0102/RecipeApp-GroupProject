require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'luis', email: 'example@email.com', password: 'password') }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).not_to be_valid
    end
  end
end
