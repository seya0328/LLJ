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
    get 'users/index'
    get 'users/show'
  end
  namespace :admin do
    get 'post_comments/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: 'homes#top'
  
  resources :posts, only: [:index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    member do
      get :search
    end
    resources :children, only: [:new, :create, :show, :edit, :update]
      # resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] 
      # resources :post_comments, only: [:create, :destroy]
  end
  resources :users do
  member do
    get :likes
  end
end
  get '/users/:user_id/check' => 'users#check', as: 'check'
  patch  '/users/:user_id/withdraw' => 'users#withdraw'
  get '/children/:id/posts/new' => 'posts#new', as: 'new_post'
  post 'children/:id/posts' => 'posts#create',as: 'children_post'
  delete 'childen/:id/posts/:post_id' => 'posts#destroy',as: 'delete_children_post'
  get 'childen/:id/posts/:post_id' => 'posts#show',as: 'show_post'
  # get '/user_id/childs/:id' => 'children#show'
  
end
