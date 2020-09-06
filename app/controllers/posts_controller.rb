class PostsController < ApplicationController
  before_action :allow_logged_in, {only: [:new, :create, :edit, :update, :destroy]}
  before_action :allow_proper_user, {only: [:edit, :update, :destroy]}
  
  def search
    @word = params[:word]
    if @word.blank?
      posts = nil
    else
      posts = Post.where("title ILIKE ?","%#{@word}%").or(Post.where("tags ILIKE ?","%#{@word}%").or(Post.where("content ILIKE ?","%#{@word}%")))
      @search_count = posts.count
      @posts = posts.page(params[:page]).per(30)
    end
  end
  
  def new
    @submit = "/posts/new"
    @post = Post.new
  end
  
  def create
    @post = @current_user.posts.build(title: params[:post_title], image_name: params[:post_image], tags: params[:post_tags].strip.gsub(/[\s　]+/," "), content: params[:post_content], like_count: 0)
    if @post.save
      @current_user.update(post_count: @current_user.posts.count)
      redirect_to("/")
    else
      @message = @post
      @submit = "/posts/new"
      render("posts/new")
    end
  end

  def edit
    @submit = "/posts/#{@target_user.name}/#{params[:id]}/update"
    @post = @target_user.posts.find_by(id: params[:id])
    render("posts/new")
  end
  
  def update
    @post = @target_user.posts.find_by(id: params[:id])
    title = params[:post_title]
    post_image = params[:post_image]
    tags = params[:post_tags].strip.gsub(/[\s　]+/," ")
    content = params[:post_content]
    
    if post_image ? @post.update(title: title, image_name: post_image, tags: tags, content: content) : @post.update(title: title, tags: tags, content: content)
      redirect_to("/users/#{@target_user.name}")
    else
      @message = @post
      @submit = "/posts/#{@target_user.name}/#{@post.id}/update"
      render("posts/new")
    end
  end
  
  def show
    @post = @target_user.posts.find_by(id: params[:id])
    @tags = @post.tags.split(/\s/)
    @post_contents = @post.content.split(/\n/)
  end
  
  def destroy
    post = @target_user.posts.find_by(id: params[:id])
    if post.destroy
      @target_user.update(post_count: @target_user.posts.count)
    end
    
    redirect_to("/users/#{@target_user.name}")
  end
end
