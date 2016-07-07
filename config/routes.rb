Rails.application.routes.draw do
  root 'welcome#index'

  get "logout" => "sessions#destroy", :as => "logout"
  get "sign_in" => "sessions#new", :as => "login"
  get "sign_up" => "users#new", :as => "signup"

  resources :welcome, only: [:index]
  resources :users
  resources :sessions

  resources :quizzes, except: [:destroy] do
    resources :questions, except: [:show, :index]
    resources :attempts, only: [:new, :create]
    resources :answers, only: [:index]
  end

  resources :about, only: [:index]
  resources :contacts, only: [:index]
end
