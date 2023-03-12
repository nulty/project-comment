Rails.application.routes.draw do
  resources :comments
  get 'projects/:id', to: 'projects#show', as: :project
  get 'projects', to: 'projects#index', as: :projects
  post 'projects/:id/comment', to: 'projects#comment', as: :project_comment

  get 'home/show'
  get 'signin', to: 'sessions#new', as: :signin
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy', as: :signout

  get 'signup', to: 'registrations#new'
  post 'signup', to: 'registrations#create'

  resources :users
  namespace :admin do
    resources :projects
  end

  root 'home#show'
end
