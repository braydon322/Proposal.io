Rails.application.routes.draw do
  devise_for :admins, :controllers => { registrations: 'admin_registrations' }
  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks", registrations: 'user_registrations'  }
  resources :proposals
  resources :fees
  resources :milestones

  root to: "pages#index"

  get '/users/sign_out' => 'devise/sessions#destroy'
  get '/admins/sign_out' => 'devise/sessions#destroy'
  get '/sort', to: 'pages#sort', as: "sort"
  get '/creative', to: 'pages#creative'
  get '/profile', to: 'pages#profile'
  get '/company', to: 'pages#company'
  get '/cmpny', to: 'pages#companydash'
  get '/crtv', to: 'pages#creativedash'
  get '/proposals/:id/sign', to: 'proposals#sign', as: "sign"
  patch '/proposals/:id/sign', to: 'proposals#sign_check', as: "verify"
  get '/crtv/price_up', to: 'proposals#price_up', as: "up"
  get '/crtv/price_down', to: 'proposals#price_down', as: "down"
  get '/crtv/signed', to: 'proposals#signed', as: "signed"
  get '/crtv/not_signed', to: 'proposals#unsigned', as: "unsigned"
  get '/crtv/date_up', to: 'proposals#date_up', as: "date_up"
  get '/crtv/date_down', to: 'proposals#date_down', as: "date_down"
end
