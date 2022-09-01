Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pokemons do
    resources :bookings, only: [:new, :create]
  end

  resources :pokemons, :pages, :shared

  # Defines the root path route ("/")
  # root "articles#index"
  get "profile", to: "pages#profile"
end
