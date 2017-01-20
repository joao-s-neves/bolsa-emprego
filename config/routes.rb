Rails.application.routes.draw do
  root 'static_pages#home'

  get 'sessions/new'
  get 'candidates/new'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]

  get  '/candidates/signup',  to: 'candidates#new', as: 'signup_candidate'
  post  '/candidates/signup',  to: 'candidates#new'
  get  '/candidates/home',  to: 'candidates#home'
  resources :candidates

  get  '/companies/signup',  to: 'companies#new', as: 'signup_companies'
  post  '/companies/signup',  to: 'companies#new'
  get  '/companies/home',  to: 'companies#home'
  resources :companies

  root 'static_pages#home'
  get  '/signup',  to: 'static_pages#signup'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'offers/new'
  resources :offers

  get 'articles/new'
  resources :articles
end
