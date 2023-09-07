Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :children, only: [:new, :create, :show, :edit, :update]
  end
  get '/user/:user_id/check' => 'users#check', as: 'check'
  
  
  # get '/user_id/childs/:id' => 'children#show'
  
end
