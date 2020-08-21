class UsersController < ApplicationController
  before_action :allow_logged_in, {only: [:show]}
  before_action :allow_logged_out, {only: [:signup, :create]}
  before_action :allow_proper_user, {only: [:show]}
  
  def show
  end

  def index
    @users = User.page(params[:page]).per(10)
  end
  
  def signup
  end
  
  def login_form
  end
  
  def login
    @user = User.find_by(name: params[:name],password: params[:password])
    if @user
      session[:user_name] = @user.name
      redirect_to("/")
    else
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_name] = nil
    redirect_to("/about")
  end
  
  def create
    @user = User.new(name: params[:name],password: params[:password], image_name: "default.jpg")
    
    if @user.save
      session[:user_name] = @user.name
      redirect_to("/")
    else
      render("users/signup")
    end
  end
  
  def update
    user_image = params[:user_image]
    if user_image
      File.delete("public/user_images/#{@current_user.image_name}")
      time = DateTime.now
      @current_user.image_name = "#{@current_user.name + format("%02d%02d%02d",time.hour.to_s,time.minute.to_s,time.second.to_s)}.jpg"
      @current_user.save
      File.binwrite("public/user_images/#{@current_user.image_name}",user_image.read)
    end
    
    redirect_to("/users/#{@current_user.name}")
  end
  
  def destroy
    @current_user.destroy
    session[:user_name] = nil
    
    redirect_to("/about")
  end
  
  def edit
    
  end
end
