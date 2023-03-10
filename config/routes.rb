Rails.application.routes.draw do
  get 'registrations/new'
  get 'registrations/create'
  resources :users
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
