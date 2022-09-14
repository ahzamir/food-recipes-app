Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  resources :recipe_foods
  resources :recipes, except: :update
  resources :recipes, except: :update do
    resources :recipe_foods
  end

  resources :shopping_list
  resources :foods, except: :update
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
