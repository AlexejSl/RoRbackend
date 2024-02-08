Rails.application.routes.draw do
  resources :posts, only: [:index, :show, :create, :destroy] do
    get '/comments', to: 'comments#index'
    post '/comments', to: 'comments#create'
    delete '/comments/:id', to: 'comments#destroy'
  end

  get '/users/:username/posts', to: 'posts#index_by_user'
  resources :users, only: [:index, :create]
end


