Rails.application.routes.draw do

  resources :channels do
    resource :channel_user
    resources :messages
  end
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

  # Achievements page
  get 'achievements', to: 'logged_workouts#achievements'



end
