Rails.application.routes.draw do
  get 'charges/new'

  resources :wikis
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  root 'welcome#index'
end
