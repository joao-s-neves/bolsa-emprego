Rails.application.routes.draw do
  get 'candidates/new'

  resources :users
  resources :companies

  root 'static_pages#home'
  get 'static_pages/home'
  get  '/signup_c',  to: 'users#new'
  get  '/signup_e',  to: 'companies#new'
  get  '/signup',  to: 'static_pages#signup'
  post '/signup_c',  to: 'users#create'
  post '/signup_e',  to: 'companies#create'
end
