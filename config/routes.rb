Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :proposals

  root to: "pages#index"
end
