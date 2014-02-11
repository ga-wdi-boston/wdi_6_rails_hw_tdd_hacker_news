HackerNews::Application.routes.draw do

  devise_for :users

  # Nested route to make sure posts always belong to users
  resources :users do
    resources :posts
  end

  root 'posts#index'

end
