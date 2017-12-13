Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :proposals
  resources :fees
  resources :milestones

  root to: "pages#index"
  
  get '/creative', to: 'pages#creative'
  get '/company', to: 'pages#company'
  get '/cmpny', to: 'pages#companydash'
  get '/crtv', to: 'pages#creativedash'
  get '/proposals/:id/sign', to: 'proposals#sign', as: "sign"
  get '/crtv/price_up', to: 'proposals#price_up', as: "up"
  get '/crtv/price_down', to: 'proposals#price_down', as: "down"
  get '/crtv/signed', to: 'proposals#signed', as: "signed"
  get '/crtv/not_signed', to: 'proposals#unsigned', as: "unsigned"
  get '/crtv/date_up', to: 'proposals#date_up', as: "date_up"
  get '/crtv/date_down', to: 'proposals#date_down', as: "date_down"
end
