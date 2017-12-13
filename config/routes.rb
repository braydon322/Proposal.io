Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :proposals
  resources :fees
  resources :milestones

  root to: "pages#index"
end
