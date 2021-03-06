Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles do 
    resources :comments 
  end 

  resources :tags

  resource :author

  resources:author_sessions, only: [:create, :new, :destroy]
  get 'login' => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
end