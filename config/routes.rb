Rails.application.routes.draw do
  devise_for :users
  resources :dishes, except: :destroy
  get 'dishes/:search', to: 'dishes#index'
  get 'users/:id/dishes', to: 'dishes#get_dishes', as: :user_dishes
  root 'dishes#index'
end
