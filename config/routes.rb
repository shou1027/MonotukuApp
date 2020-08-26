Rails.application.routes.draw do
  get "posts/new" => "posts#new"
  post "posts/new" => "posts#create"
  get "posts/search" => "posts#search"
  get "posts/:user_name/:id" => "posts#show"
  get "posts/:user_name/:id/edit" => "posts#edit"
  post "posts/:user_name/:id/update" => "posts#update"
  post "posts/:user_name/:id/destroy" => "posts#destroy"
  
  get "signup" => "users#signup"
  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"
  get 'users' => "users#index"
  get "users/search" => "users#index"
  get "users/:user_name" => "users#show"
  post "users/new" => "users#create"
  get "users/:user_name/edit" => "users#edit"
  post "users/:user_name/follow"
  post "users/:user_name/unfollow"
  post "users/:user_name/update" => "users#update"
  post "users/:user_name/destroy" => "users#destroy"
  
  get "/" => "home#home"
  get "timeline" => "home#timeline"
  get "tag" => "home#tag"
  get "about" => "home#about"
  get "help" => "home#help"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
