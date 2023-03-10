Rails.application.routes.draw do
  get 'home/show'
  get 'signup', to: 'registrations#new'
  post 'signup', to: 'registrations#create'

  resources :users
  resources :projects

  root 'home#show'
end
