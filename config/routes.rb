Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  root to: 'foods#index'
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: %i[index show new create edit update destroy] do
    resources :recipe_foods, only: %i[new edit create destroy update]
    resources :public_recipes, module: :recipes, only: [:show]
  end
  
  get '/public_recipes', to: 'recipes#public_recipes'
  get '/generalshoppinglist', to: 'generalshoppinglist#index'
  
  get '/shopping_list/:id', to: 'users#shopping_list', as: 'shopping_list'
  
  get 'add_food', to: 'recipe_foods#new', as: 'add_food_recipe'
end
