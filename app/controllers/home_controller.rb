class HomeController < ApplicationController
  def about
  end

  def home
    @content_name = "新着"
    @posts = Post.limit(10).order(created_at: :desc)
  end
  
  def timeline
    @content_name = "タイムライン"
    @posts = Post.limit(10).order(created_at: :asc)
    render("home/home")
  end
  
  def tag
    @content_name = "タグ"
    @posts = Post.limit(10).order(created_at: :desc)
    render("home/home")
  end

  def help
  end
end
