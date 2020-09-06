class UsersController < ApplicationController
  before_action :allow_logged_in, {only: [:logout, :edit, :update, :destroy]}
  before_action :allow_logged_out, {only: [:login_form, :login, :signup, :create]}
  before_action :allow_proper_user, {only: [:edit, :update, :destroy]}
  
  def show
    @posts = @target_user.posts.order(created_at: :desc).page(params[:page]).per(30)
  end
  
  def following
    @users = Kaminari.paginate_array(@target_user.following.reverse).page(params[:page]).per(30)
  end
  
  def followers
    @users = Kaminari.paginate_array(@target_user.followers.reverse).page(params[:page]).per(30)
  end
  
  def index
    word = params[:word]
    if !word.blank?
      if word == "_"
        @users = User.where("name ILIKE ?","\\_%").order(name: :asc).page(params[:page]).per(30)
      else
        @users = User.where("name ILIKE ?","#{word}%").order(name: :asc).page(params[:page]).per(30)
      end
    else
      @users = User.page(params[:page]).per(30)
    end
  end
  
  def login_form
  end
  
  def login
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:succcess] = "ログインしました"
      redirect_to("/")
    else
      flash[:danger] = "入力情報が間違っています"
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:succcess] = "ログアウトしました"
    redirect_to("/about")
  end
  
  def signup
    @user = User.new
  end
  
  def create
    @user = User.new(name: params[:name],password: params[:password], password_confirmation: params[:confirm], tags: "", post_count: 0)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:succcess] = "ログインしました"
      redirect_to("/")
    else
      @message = @user
      render("users/signup")
    end
  end
  
  def edit
  end
  
  def update
    image_name = params[:image_name]
    tags = params[:tags].strip.gsub(/[\s　]+/," ")
    
    if image_name ? @target_user.update(image_name: image_name, tags: tags) : @target_user.update(tags: tags)
      redirect_to("/users/#{@target_user.name}")
    else
      render("users/edit")
    end
  end
  
  def destroy
    @target_user.destroy
    session[:user_id] = nil
    
    redirect_to("/about")
  end
end
