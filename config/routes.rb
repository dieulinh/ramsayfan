Rails.application.routes.draw do
  resources :dishes, only: [:index, :show, :new]
  root 'dishes#index'
end
