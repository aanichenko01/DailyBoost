Rails.application.routes.draw do

  # Resouce paths
  resources :exercises, except: [:index]
  resources :workouts
  devise_for :users

  # Home page is root
  root 'home#home'
  get 'home', to: "home#home"

  # Contact page
  get 'contact', to: 'home#contact'
  #post route for the contact form
  post 'request_contact', to: 'home#request_contact'

end
