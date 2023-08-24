Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index'
  resources :countries, only: %i[index show] do
    member do
      patch "toggle_favorite", to: "countries#toggle_favorite"
    end
  end

  get "world_map", to: "countries#world_map", as: :world_map

  resources :topics, only: %i[index show] do
    member do
      patch "toggle_favorite", to: "topics#toggle_favorite"
    end
  end

  resources :articles, only: %i[index show] do
    member do
      patch "toggle_favorite", to: "articles#toggle_favorite"
    end
  end

  resources :articles, only: :show do
  end

  get "/profile", to: "pages#profile", as: :profile
  get "refresh_pins", to: "pages#refresh_pins"

end
