HackerNews::Application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :posts do
  	resources :comments, only: [:index, :create]
  end

  post "/posts/:post_id/comments" => 'comments#create'

  # resources :user do
  # 	resources :posts do
  # 		resources :comments, only: [:index, :create]
  # 	end
  # end

  # post "people/:id" => 'people#show'
  # resources :users, only: [:index, :show, :new, :create]

end
