Rails.application.routes.draw do
  resources :wikis
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  root 'welcome#index'
end
