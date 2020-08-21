Rails.application.routes.draw do
  get "posts/new" => "posts#new"
  get "posts/edit" => "posts#edit"
  get "posts/search/" => "posts#search"
  
  get "signup" => "users#signup"
  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"
  get 'users' => "users#index"
  get "users/:user_name" => "users#show"
  post "users/new" => "users#create"
  get "users/search/:word" => "users#index"
  get "users/:user_name/edit" => "users#edit"
  post "users/:user_name/update" => "users#update"
  post "users/:user_name/destroy" => "users#destroy"
  
  get "/" => "home#home"
  get "timeline" => "home#timeline"
  get "tag" => "home#tag"
  get "about" => "home#about"
  get "help" => "home#help"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
