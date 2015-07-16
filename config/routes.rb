Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :dishes, except: :destroy
  get 'dishes/:search', to: 'dishes#index'
  get '/user_view_all', to: 'dishes#get_dishes', as: :user_dishes
  put '/user_publish/:id', to: 'dishes#publish', as: :user_publish
  root 'dishes#index'
end
