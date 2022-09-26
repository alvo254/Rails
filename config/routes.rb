Rails.application.routes.draw do
  resources :friends
  # get 'home/index'
  get 'comments/index'
  get 'home/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root "home#index"

  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"

  # This is good as it eliminates the need to specify the path 
  resources :articles do
    resources :comments
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
