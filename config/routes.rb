HackerNews::Application.routes.draw do

  devise_for :users

  # Nested route to make sure posts always belong to users
  resources :users

  resources :posts do
    resources :comments
  end

  root 'posts#index'

end
