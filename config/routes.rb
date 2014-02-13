HackerNews::Application.routes.draw do
  devise_for :users
  resources :articles do
    get 'vote_up' => 'votes#vote_up',
      as: 'vote_up',
      defaults: {votable: 'article'}
    get 'vote_down' => 'votes#vote_down',
      as: 'vote_down',
      defaults: {votable: 'article'}

    resources :comments do
      get 'vote_up' => 'votes#vote_up',
        as: 'vote_up',
        defaults: {votable: 'comment'}
      get 'vote_down' => 'votes#vote_down',
        as: 'vote_down',
        defaults: {votable: 'comment'}
    end
  end

  root to: 'articles#index'
end
