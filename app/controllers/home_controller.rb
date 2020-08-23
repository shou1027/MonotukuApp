class HomeController < ApplicationController
  def about
  end

  def home
    @content_name = "新着"
    @posts = Post.page(params[:page]).per(30)
  end
  
  def timeline
    @content_name = "タイムライン"
    @posts = Post.page(params[:page]).per(30)
    render("home/home")
  end
  
  def tag
    @content_name = "タグ"
    @posts = Post.page(params[:page]).per(30)
    render("home/home")
  end

  def help
  end
end
