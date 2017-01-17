Rails.application.routes.draw do
  root 'static_pages#home'

  get 'sessions/new'
  get 'candidates/new'

  resources :users

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  get  '/candidates/signup',  to: 'candidates#new', as: 'signup_candidate'
  post  '/candidates/signup',  to: 'candidates#new'
  get  '/companies/new',  to: 'companies#new'
  resources :candidates

  get  '/companies/signup',  to: 'companies#new', as: 'signup_companies'
  post  '/companies/signup',  to: 'companies#new'
  resources :companies

  root 'static_pages#home'
  get 'offers/new'
  get  '/signup',  to: 'static_pages#signup'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'offers/new'
  resources :offers
end
