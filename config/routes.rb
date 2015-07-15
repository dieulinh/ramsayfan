Rails.application.routes.draw do
  devise_for :users
  resources :dishes, except: :destroy
  get 'dishes/:search', to: 'dishes#index'
  root 'dishes#index'
end
