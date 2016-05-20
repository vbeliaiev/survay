Rails.application.routes.draw do
  root 'welcome#index'

  get "logout" => "sessions#destroy", :as => "logout"
  get "sign_in" => "sessions#new", :as => "login"
  get "sign_up" => "users#new", :as => "signup"

  resources :welcome, only: [:index]
  resources :users
  resources :sessions

  resources :quizzes, only: [:index, :show, :new, :create] do
    resources :questions, only: [:new, :create]
    resources :attempts, only: [:new, :create]
  end

  resources :about, only: [:index]
  resources :contacts, only: [:index]
end
