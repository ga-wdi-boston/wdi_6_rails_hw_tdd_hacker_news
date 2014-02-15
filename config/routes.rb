HackerNews::Application.routes.draw do
  devise_for :users

  resources :posts do
    resources :votes, defaults: { votable: 'post'}
    resources :comments do
      resources :votes, defaults: { votable: 'comment' }
    end
  end

  root to: 'posts#index'

end
