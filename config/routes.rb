Rails.application.routes.draw do
  get 'sessions/new'

  get 'candidates/new'

  resources :users
  resources :companies

  root 'static_pages#home'
  get 'static_pages/home'
  get  '/signup_c',  to: 'users#new'
  get  '/signup_e',  to: 'companies#new'
  post '/signup_c',  to: 'users#create'
  post '/signup_e',  to: 'companies#create'
  get  '/signup',  to: 'static_pages#signup'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
