require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { User.create(name: 'luis', email: 'example@email.com', password: 'password') }
  let(:recipe) { Recipe.create(name: 'recipe', description: 'a delicious recipe', user_id: user.id) }
  let(:food) { Food.create(name: 'food', measurement_unit: 'grams', price: 3, quantity: 2, user_id: user.id) }
  let(:recipe_food) { RecipeFood.new(recipe_id: recipe.id, food_id: food.id, quantity: 2) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(recipe_food).to be_valid
    end

    it 'is not valid without a quantity' do
      recipe_food.quantity = nil
      expect(recipe_food).not_to be_valid
    end
  end

  describe '#calculate_value_by_quantity' do
    it 'calculates the value by quantity' do
      expect(recipe_food.calculate_value_by_quantity).to eq(6)
    end
  end
end
