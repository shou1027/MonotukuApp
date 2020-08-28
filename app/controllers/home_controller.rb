class HomeController < ApplicationController
  include HomeHelper
  before_action :allow_logged_in, {only: [:timeline, :tag]}
  
  def home
    @content_name = "新着"
    @posts = Post.order(created_at: :desc).page(params[:page]).per(30)
  end
  
  def timeline
    @content_name = "タイムライン"
    @posts = following_works
    
    if !@posts.blank?
      @posts = @posts.order(created_at: :desc).page(params[:page]).per(30)
    end
    render("home/home")
  end
  
  def tag
    @content_name = "タグ"
    @posts = tag_works
    
    if !@posts.blank?
      @posts = @posts.page(params[:page]).per(30)
    end
    render("home/home")
  end

  def about
  end
  
  def help
  end
end
