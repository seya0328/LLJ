Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  
  resources :users, only: [:show, :edit, :update, :destroy]
  get '/user/:user_id/check' => 'users#check', as: 'check'
  
  resources :children, only: [:new, :create, :index, :show, :edit, :update]
  
  resources :posts, only: [ :create, :index, :show, :edit, :update, :destroy]
end
