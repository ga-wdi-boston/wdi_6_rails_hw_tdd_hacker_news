HackerNews::Application.routes.draw do
  devise_for :users
  root to: 'articles#index'
end
