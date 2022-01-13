Rails.application.routes.draw do
  get 'todolists/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, only: [:index, :new, :show, :create, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
  root "lists#index"
end
