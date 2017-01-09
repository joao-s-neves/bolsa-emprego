Rails.application.routes.draw do
  get 'companies/new'

  get 'users/new'

  root 'static_pages#home'
  get 'static_pages/home'
  get  '/signup',  to: 'users#new'
  get  '/signup',  to: 'companies#new'
end
