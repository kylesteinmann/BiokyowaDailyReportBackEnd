Rails.application.routes.draw do
  resources :notifications
  resources :fermentations
  resources :extractions
  resources :packagings
  post 'fermentations/import', to: 'fermentations#import'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # api/v1/routes

  # localhost:3000/api

  namespace :api, defaults: { format: :json} do
    # version 1
    #api/v1
    namespace :v1 do
      #api/v1/users
      #login, logout, me, create
      namespace :users do
        #post "/users/login" to: "users#login"
        post :login
        post :create
        get :me
        delete :logout
      end
    end
  end



end
