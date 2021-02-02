Rails.application.routes.draw do

  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :breweries, only: [:index] do
    resources :ratings, only: [:index, :new, :create]
  end
  resources :ratings, only: [:new, :create, :edit, :update, :destroy]
  resources :users

  root to: 'static#home'
  get '/about-us', to: 'static#about'
  get '/contact-us', to: 'static#contact'
  
end
