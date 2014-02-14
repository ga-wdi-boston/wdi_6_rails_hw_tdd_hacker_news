HackerNews::Application.routes.draw do
  devise_for :users
  resources :articles do
    resource :vote, only: :create, defaults: { votable: 'article' }
    resources :comments do
      resource :vote, only: :create, defaults: { votable: 'comment' }
    end
  end

  root to: 'articles#index'
end
