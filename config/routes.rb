Rails.application.routes.draw do

  resources :breweries, only: [:index] do
    resources :ratings, only: [:index, :new, :create]
  end
  resources :ratings, only: [:new, :create, :edit, :update, :destroy]

  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"


  delete "logout", to: "sessions#destroy", as: "destroy_session"
  

  root to: 'static#home'
  get '/about-us', to: 'static#about'
  get '/contact-us', to: 'static#contact'
  
end
