Rails.application.routes.draw do
  get 'charges/new'

  resources :wikis
  resources :charges, only: [:new, :create, :destroy]
  resources :collaborators, only: [:create, :destroy]
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  root 'welcome#index'
end
