Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  resources :sessions, only: ['create', 'destroy']
  
  get 'singin', to: 'users#new'
  resources :users, except: ['new']
  
  resources :items, only: [:new]
end
