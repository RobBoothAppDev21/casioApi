Rails.application.routes.draw do
  root 'static_pages#index'
  get 'static_pages/index'
  get 'test/index', to: 'test#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
