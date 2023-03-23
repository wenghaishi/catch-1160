Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  namespace :biz do
    resources :businesses, except: :show
    resources :users, only: %i[show]

    get 'me', to: 'businesses#me'
  end

  resources :businesses do
    resources :collections, only: %i[new create edit update destroy]
  end
  resources :collections, only: %i[show] do
    resources :tokens, only: %i[new create edit update destroy]
  end
  resources :tokens, only: %i[show index] do
    # resources :captures, only: %i[new create edit update destroy]
    get :capture
  end
  resources :users, only: %i[show]

end
