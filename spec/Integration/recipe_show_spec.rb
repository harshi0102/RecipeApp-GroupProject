require 'rails_helper'

RSpec.describe 'Recipes index view', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'luis',
      email: 'luis@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    )
    @food = Food.create(
      name: 'food',
      measurement_unit: 'grams',
      price: 3,
      quantity: 2,
      user_id: @user.id
    )
    @recipe = Recipe.create(
      name: 'recipe',
      description: 'a delicious recipe',
      user_id: @user.id
    )
    login_as(@user, scope: :user)
    visit recipes_path
  end

  it 'displays the title' do
    expect(page).to have_content('Recipes')
  end

  it 'displays the recipe name' do
    expect(page).to have_content('recipe')
  end

  it 'displays the recipe description' do
    expect(page).to have_content('a delicious recipe')
  end

  it 'displays a link to create a new recipe' do
    expect(page).to have_link('New Recipe', href: new_recipe_path)
  end
end
