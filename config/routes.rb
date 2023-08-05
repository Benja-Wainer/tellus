Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index'
  resources :countries, only: %i[index show]

  resources :topics, only: %i[index]

  resources :articles, only: :show

  get "/profile", to: "pages#profile", as: :profile

end
