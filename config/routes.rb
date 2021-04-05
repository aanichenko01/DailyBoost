Rails.application.routes.draw do

  # Resouce paths
  resources :exercises
  resources :workouts
  devise_for :users

  # Home page is root
  root 'home#home'
  get 'home', to: "home#home"

  # Contact page
  get 'contact', to: 'home#contact'

end
