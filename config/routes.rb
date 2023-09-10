Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :posts, only: [:index, :show, :edit, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :children, only: [:new, :create, :show, :edit, :update]
      # resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] 
      # resources :post_comments, only: [:create, :destroy]
  end
  get '/users/:user_id/check' => 'users#check', as: 'check'
  get '/children/:id/posts/new' => 'posts#new', as: 'new_post'
  post 'children/:id/posts' => 'posts#create',as: 'children_post'
  delete 'childen/:id/posts/:post_id' => 'posts#destroy',as: 'delete_children_post'
  
  # get '/user_id/childs/:id' => 'children#show'
  
end
