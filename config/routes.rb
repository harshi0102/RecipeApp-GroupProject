# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#index'
  resources :foods, only: %i[index show new create destroy]
  resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update]
  end
  get '/public_recipes', to: 'recipes#public_recipes'
  get '/general_shopping_list', to: 'recipes#general_shopping_list'
end
