Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index'
  resources :countries, only: %i[index show]
  get "/countries/:country_id/subscriptions", to: "subscriptions#country", as: :country_subscription
  get "/countries/:topic_id/subscriptions", to: "subscriptions#topic", as: :topic_subscription

  resources :topics, only: %i[index] do
    resources :subscriptions, only: :create
  end

  resources :articles, only: :show

  get "/profile", to: "users#show", as: :profile

end
