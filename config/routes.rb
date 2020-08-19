Rails.application.routes.draw do
  get 'posts/index'

  get 'posts/edit'

  get 'posts/post'

  get 'posts/search'

  get 'users/show'

  get 'users/index'
  
  get "signup" => "users#signup"
  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"
  post "new" => "users#new"
  
  get "/" => "home#home"
  get "timeline" => "home#timeline"
  get "tag" => "home#tag"
  get "about" => "home#about"
  get "help" => "home#help"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
