Rails.application.routes.draw do
  devise_for :users
  # root 'sessions#new'
  root 'links#index'
  get "/links/:id", to: "links#show"
  post "/links", to: "links#create"
  post "/", to: "links#create"
  # get "/users/sign_out"
  # delete "/users", to: "links#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/:short_url", to: "links#forward"

  namespace :api do
    get "/links", to: "links#index"
  end

  # devise_scope :user do
  #   get 'sign_in', to: 'devise/sessions#new'
  #   # post 'sign_in', to: 'devise/sessions#create'
  # end
end
