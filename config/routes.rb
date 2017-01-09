Rails.application.routes.draw do
  resources :users
  resources :companies

  root 'static_pages#home'
  get 'static_pages/home'
  get  '/signup',  to: 'users#new'
  get  '/signup',  to: 'companies#new'
  post '/signup',  to: 'users#create'
  post '/signup',  to: 'companies#create'
end
