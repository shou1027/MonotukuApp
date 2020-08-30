Rails.application.routes.draw do
  post "likes/:user_name/:id/like" => "likes#like"
  post "likes/:user_name/:id/unlike" => "likes#unlike"

  post "relationships/:user_name/follow" => "relationships#follow"
  post "relationships/:user_name/unfollow" => "relationships#unfollow"

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
  get "users/:user_name/following" => "users#following"
  get "users/:user_name/followers" => "users#followers"
  get "users/:user_name/edit" => "users#edit"
  post "users/:user_name/update" => "users#update"
  post "users/:user_name/destroy" => "users#destroy"
  
  get "/" => "home#home"
  get "timeline" => "home#timeline"
  get "tag" => "home#tag"
  get "about" => "home#about"
  get "help" => "home#help"
  get "sample" => "home#sample"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
