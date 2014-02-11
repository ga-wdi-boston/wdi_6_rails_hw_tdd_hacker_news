HackerNews::Application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :users do
    resources :posts do
    	resources :comments
    end
  end
end
