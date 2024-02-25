Rails.application.routes.draw do
  resources :posts, only: [:index, :show, :create, :destroy] do
    get '/comments', to: 'comments#index'
    post '/comments', to: 'comments#create'
    delete '/comments/:id', to: 'comments#destroy'
  end

  get '/posts/most_commented', to: 'posts#most_commented' # posts with most comments
  get '/users/most_posts', to: 'users#most_posts' #users with most posts
  get '/users/most_engaged', to: 'users#most_engaged' #users with most engagement on their posts/top3 users with highest amount of average comments on their posts
  get '/users/:username/posts', to: 'posts#index_by_user'
  resources :users, only: [:index, :create]
end


