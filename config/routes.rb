HackerNews::Application.routes.draw do
  devise_for :users

  resources :articles do
    resources :comments
  end

  root to: 'articles#index'

  post '/articles/:article_id/votes', to: 'votes#vote', as: 'new_article_vote', defaults: { votable: 'article' }

  post '/comments/:comment_id/votes', to: 'votes#vote', as: 'new_comment_vote', defaults: { votable: 'comment' }
end
