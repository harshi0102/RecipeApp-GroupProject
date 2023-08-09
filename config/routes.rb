Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  root to: 'users#index'
  resources :foods, only: %i[index show new create destroy]
  resources :recipes, only: %i[index show new create destroy update] do
    resources :recipe_foods, only: %i[new create destroy update]
    resources :public_recipes, only: [:index, :show]
  end
  get '/shopping_list/:id', to: 'users#shopping_list', as: 'shopping_list'
  get '/public_recipes', to: 'recipes#public_recipes'
  get '/generalshoppinglist', to: 'generalshoppinglist#index'
  get 'new_food', to: 'recipe_foods#new', as: 'new_recipe_food'
end
