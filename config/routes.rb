Rails.application.routes.draw do

  resources :ratings, only: [:new, :create, :edit, :update, :destroy]
  resources :breweries, only: [:index] do
    resources :ratings, only: [:index, :new, :create]
  end

  #user authentication (signup, login, logout)
  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "destroy_session"
  
  #omniauth
  match '/auth/google_oauth2/callback' => 'sessions#google', via: [:get, :post]
  match '/auth/facebook/callback' => 'sessions#facebook', via: [:get, :post]

  root to: 'static#home'
  
  get "/top100", to: "breweries#top100", as: "top100"
  get "/my_reviews", to: "ratings#personal_index", as: "my_reviews"
  get 'profile', to: "users#profile", as: "profile"

  match '*path', via: :all, to: "static#show_404", constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
}
end

