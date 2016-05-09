Rails.application.routes.draw do
  root 'welcome#index'

  get "logout" => "sessions#destroy", :as => "logout"
  get "sign_in" => "sessions#new", :as => "login"
  get "sign_up" => "users#new", :as => "signup"

  resources :welcome, only: [:index]
  resources :users
  resources :sessions

  resources :quizzes, only: [:index]
  resources :about, only: [:index]
  resources :contacts, only: [:index]
end
