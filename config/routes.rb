Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :breweries do
    resources :ratings
  end
  
  resources :ratings
  resources :users

  root to: 'static#home'
  get '/about-us', to: 'static#about'
  get '/contact-us', to: 'static#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
