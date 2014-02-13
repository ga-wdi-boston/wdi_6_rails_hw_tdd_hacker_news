HackerNews::Application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :posts, only: [:index, :new, :create] do
  	resources :comments, only: [:index, :create] do
    end
  end

  post "/posts/:post_id/comments" => 'comments#create'

  # upvoting posts
  get "/posts/:post_id/upvoted/comments" => 'votes#upvote',
    as: "post_upvote", defaults: {votable: :post}

  # downvoting posts
  get "/posts/:post_id/downvoted/comments" => 'votes#downvote',
    as: "post_downvote", defaults: {votable: :post}

  # upvoting comments
  get "/posts/:post_id/comments/:comment_id/upvoted" => 'votes#upvote', as: "post_comment_upvote", defaults: {votable: :comment}

  # downvoting comments
  get "/posts/:post_id/comments/:comment_id/downvoted" => 'votes#downvote',
    as: "post_comment_downvote", defaults: {votable: :comment}

end
