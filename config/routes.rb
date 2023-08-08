Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "users#index"
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update]
  end 
  get '/public_recipes', to: 'recipes#public_recipes'
  get '/general_shopping_list', to: 'recipes#general_shopping_list'


end