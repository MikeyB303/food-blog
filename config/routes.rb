Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => 'blogs#index'
  get 'blogs/new' => 'blogs#new'
  post 'blogs' => 'blogs#create'
  get 'users/new' => 'users#new'
  get 'sessions/new' => 'sessions#new'
  post 'users' => 'users#create'
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

end
