Rails.application.routes.draw do
  devise_for :users
  resources :dishes, except: :destroy
  get 'dishes/:search', to: 'dishes#index'
  get '/user_view_all', to: 'dishes#get_dishes', as: :user_dishes
  root 'dishes#index'
end
