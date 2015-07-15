Rails.application.routes.draw do
  resources :dishes, only: [:index, :show, :new]
  get 'dishes/:search', to: 'dishes#index'
  root 'dishes#index'
end
