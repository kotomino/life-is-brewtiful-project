Rails.application.routes.draw do

  resources :breweries, only: [:index] do
    resources :ratings, only: [:index, :new, :create]
  end
  get "/top100", to: "breweries#top100", as: "top100"

  resources :ratings, only: [:new, :create, :edit, :update, :destroy]
  get "/my_reviews", to: "ratings#personal_index", as: "my_reviews"

  get 'profile', to: "users#profile", as: "profile"

  # Signup, Login, and Logout
  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "destroy_session"
  
  match '/auth/google_oauth2/callback' => 'sessions#google', via: [:get, :post]
  match '/auth/facebook/callback' => 'sessions#facebook', via: [:get, :post]

  root to: 'static#home'
  get '/about-us', to: 'static#about'
  get '/contact-us', to: 'static#contact'
  
end
