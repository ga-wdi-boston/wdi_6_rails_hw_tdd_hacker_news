HackerNews::Application.routes.draw do
  devise_for :users
  resources :articles do
    get 'vote_up' => 'votes#vote_up',
      as: 'vote_up',
      defaults: {votable: 'article'}
    resources :comments
  end

  root to: 'articles#index'
end
