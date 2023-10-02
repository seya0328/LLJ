Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }
  
  namespace :admin do
    get "/" => "homes#top"
    resources :users, only: [:index, :show] do
      resources :post_comments, only: [:index, :destroy]
    end
  
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: 'homes#top'
  
  resources :posts, only: [:index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  
  delete '/users/check' => 'users#check', as: 'check'
  patch  '/users/withdraw' => 'users#withdraw'
  resources :users, only: [:new, :create, :show, :edit, :update] do
    member do
      get :search
    end
    resources :children, only: [:new, :create, :show, :edit, :update]
      # resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] 
      # resources :post_comments, only: [:create, :destroy]
  end
  resources :users do
    member do
      get :favorites
    end
  end
  

  get '/children/:id/posts/new' => 'posts#new', as: 'new_post'
  post 'children/:id/posts' => 'posts#create',as: 'children_post'
  delete 'childen/:id/posts/:post_id' => 'posts#destroy',as: 'delete_children_post'
  #get 'childen/:id/posts/:post_id' => 'posts#show',as: 'show_post'
  # get '/user_id/childs/:id' => 'children#show'
  
end
