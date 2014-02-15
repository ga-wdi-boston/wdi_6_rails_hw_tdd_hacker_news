HackerNews::Application.routes.draw do
  root to: 'articles#index'
  devise_for :users
  resources :articles do
    resources :votes, defaults: {votable: 'article'}
    post '/votes/up_vote', to: 'votes#up_vote', as: 'up_vote', defaults: {votable: 'article'}
    post '/votes/down_vote', to: 'votes#down_vote', as: 'down_vote', defaults: {votable: 'article'}
    resources :comments do
      resources :votes, defaults: {votable: 'comment'}
      	post '/votes/up_vote', to: 'votes#up_vote', as: 'up_vote', defaults: {votable: 'comment'}
      	post '/votes/down_vote', to: 'votes#down_vote', as: 'down_vote', defaults: {votable: 'comment'}
    end
  end
end
