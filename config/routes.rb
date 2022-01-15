Rails.application.routes.draw do
  get 'todolists/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists
  resources :todos, only: [:new, :create, :show, :index, :destroy] do
    patch :toggle, on: :member
  end
  # Defines the root path route ("/")
  # root "articles#index"
  root "lists#index"
end
