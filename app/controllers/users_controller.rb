class UsersController < ApplicationController
  before_action :allow_logged_in, {only: [:logout, :edit, :update, :destroy]}
  before_action :allow_logged_out, {only: [:login_form, :login, :signup, :create]}
  before_action :allow_proper_user, {only: [:edit, :update, :destroy]}
  
  def show
    target_user
    posts = @target_user.posts
    @posts_count = posts.count
    @posts = posts.page(params[:page]).per(10)
  end

  def index
    word = params[:word]
    if word
      if word == "_"
        @users = User.where("name LIKE ?","\\_%").order(name: :asc).page(params[:page]).per(10)
      else
        @users = User.where("name LIKE ?","#{word}%").order(name: :asc).page(params[:page]).per(10)
      end
    else
      @users = User.page(params[:page]).per(30)
    end
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
  
  def signup
    @user = User.new
  end
  
  def create
    @user = User.new(name: params[:name],password: params[:password], image_name: "default.jpg")
    
    if (params[:confirm] == params[:password]) && @user.save
      session[:user_name] = @user.name
      redirect_to("/")
    else
      render("users/signup")
    end
  end
  
  def edit
  end
  
  def update
    user_image = params[:user_image]
    if user_image
      if (@target_user.image_name != "default.jpg") & File.exist?("public/user_images/#{@target_user.image_name}")
        File.delete("public/user_images/#{@target_user.image_name}")
      end
      time = DateTime.now
      @target_user.image_name = "#{@target_user.name + format("%02d%02d%02d",time.hour.to_s,time.minute.to_s,time.second.to_s)}.jpg"
    end
    
    @target_user.tags = params[:tags]
    
    if @target_user.save
      if user_image
        File.binwrite("public/user_images/#{@target_user.image_name}",user_image.read)
      end
      
      redirect_to("/users/#{@target_user.name}")
    else
      render("users/edit")
    end
    
  end
  
  def destroy
    if (@target_user.image_name != "default.jpg") & File.exist?("public/user_images/#{@target_user.image_name}")
      File.delete("public/user_images/#{@target_user.image_name}")
    end
    @target_user.destroy
    session[:user_name] = nil
    
    redirect_to("/about")
  end
  
end
