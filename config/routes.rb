Rails.application.routes.draw do
  devise_for :users
  root to: "tokens#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :businesses do
    resources :collections, only: %i[new create edit update destroy]
  end
  resources :collections, only: %i[show] do
    resources :tokens, only: %i[new create edit update destroy]
  end
  resources :tokens, only: %i[show index] do
    resources :captures, only: %i[new create edit update destroy]
  end
  resources :users, only: %i[show]
end
