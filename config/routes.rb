Rails.application.routes.draw do
  devise_for :users
  root to: "tokens#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tokens 
  # Defines the root path route ("/")
  # root "articles#index"
end
