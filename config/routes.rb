Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :dishes, except: :destroy do
  	member do
  		put 'like', to: 'dishes#upvote'
  		put 'dislike', to: 'dishes#downvote'
  	end
  end
  post "/dishes/add_new_comment", to: "dishes#add_new_comment", :as => "add_new_comment_to_dishes"
  get 'dishes/:search', to: 'dishes#index'
  get '/user_view_all', to: 'dishes#get_dishes', as: :user_dishes
  put '/user_publish/:id', to: 'dishes#publish', as: :user_publish
  root 'dishes#index'
end
