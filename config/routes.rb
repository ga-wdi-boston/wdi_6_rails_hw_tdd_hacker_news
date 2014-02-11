HackerNews::Application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :users do
    resources :posts do
    	resources :comments
    end
  end
  resources :posts, only: [:index, :show]

  get 'posts/:id/upvote' => 'posts#upvote', as: 'post_upvote'
end
