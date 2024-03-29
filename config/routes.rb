Auth::Application.routes.draw do
  get "presents/index" => "presents#index"
  get "reserve" => "presents#reserve_present", :as => "reserve"
  get "presents/new"
  get "presents/manage" => "presents#manage", :as => "manage_presents"
  get "kirkko" => "pages#kirkko"

  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  get "attend" => "users#attend", :as => "attend"
  root :to => "pages#index"
  
  resources :users do
    resources :guests
  end
  resources :sessions
  resources :presents

end
