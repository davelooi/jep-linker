Rails.application.routes.draw do
  devise_for :users
  root 'links#index'
  resources :links, path: ""
  post "/", to: "links#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get "/status", to: "status#alive"
  end
end
