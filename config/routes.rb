HackerNews::Application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :users

  post '/posts/:post_id/upvotes', to: 'upvotes#vote', as: 'new_post_upvote', defaults: { upvotable: 'post', vote: true }

  resources :posts do
    resources :comments do
    end
  end

  #get 'posts/:id/upvote' => 'posts#upvote', as: 'post_upvote'
end
