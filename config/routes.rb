Rails.application.routes.draw do
  get 'users/index'

  get 'users/login_form'

  get 'users/show'

  get 'users/signup'

  get 'posts/edit'

  get 'posts/search'

  get 'home/about'

  get 'home/help'

  get 'home/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/" => "users/index"
end
