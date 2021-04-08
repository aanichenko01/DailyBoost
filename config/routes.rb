Rails.application.routes.draw do

  resources :logged_workouts
  # Resouce paths
  resources :exercises
  resources :workouts do
    get "search"
  end
  devise_for :users

  # Home page is root
  root 'home#home'
  get 'home', to: "home#home"

  # Contact page
  get 'contact', to: 'home#contact'

  # Calendar page
  get 'calendar', to: 'logged_workouts#calendar'

end
