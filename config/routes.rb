Auth::Application.routes.draw do
  get "presents/index" => "presents#index"
  get "reserve" => "presents#reserve_present", :as => "reserve"
  get "presents/new"

  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  get "attend" => "users#attend", :as => "attend"
  root :to => "pages#index"
  
  resources :users
  resources :sessions
  resources :presents

end
