HackerNews::Application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :users
  resources :posts do
  	resources :comments
  end

  get 'posts/:id/upvote' => 'posts#upvote', as: 'post_upvote'
end
