HackerNews::Application.routes.draw do
  root to: 'articles#index'
  devise_for :users
  resources :articles do
    resources :votes, defaults: {votable: 'article'}
    post '/votes/up_vote', to: 'votes#up_vote'
    post '/votes/down_vote', to: 'votes#down_vote'
    resources :comments do
      resources :votes, defaults: {votable: 'comment'}
      	post '/votes/up_vote', to: 'votes#up_vote'
      	post '/votes/down_vote', to: 'votes#down_vote'
    end
  end
end
