class PostsController < ApplicationController
  before_action :allow_logged_in, {only: [:new, :create, :edit, :update, :destroy]}
  before_action :allow_proper_user, {only: [:edit, :update, :destroy]}
  
  def search
    @word = params[:word]
    posts = Post.where("title ILIKE ?","%#{@word}%").or(Post.where("tags ILIKE ?","%#{@word}%").or(Post.where("content ILIKE ?","%#{@word}%")))
    @search_count = posts.count
    @posts = posts.page(params[:page]).per(30)
  end
  
  def new
    @submit = "/posts/new"
    @post = Post.new
  end
  
  def create
    @post_image = params[:post_image]
    @post = @current_user.posts.build(title: params[:post_title], tags: params[:post_tags].strip.gsub(/[\s　]+/," "), content: params[:post_content], like_count: 0)
    time = DateTime.now
    @post.image_name = @post_image.blank? ? "" : "#{@current_user.name + format("%04d%02d%02d%02d%02d%02d",time.year.to_s,time.month.to_s,time.day.to_s,time.hour.to_s,time.minute.to_s,time.second.to_s)}.jpg"
    if @post.save
      File.binwrite("public/post_images/#{@post.image_name}", @post_image.read)
      @current_user.update(post_count: @current_user.posts.count)
      redirect_to("/")
    else
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
    @post_image = params[:post_image]
    
    if @post_image
      time = DateTime.now
      image_name_old = @post.image_name
      @post.image_name = @post_image.blank? ? "" : "#{@current_user.name + format("%04d%02d%02d%02d%02d%02d",time.year,time.month,time.day,time.hour,time.minute,time.second)}.jpg"
    end
    
    if @post.update(title: params[:post_title], tags: params[:post_tags].strip.gsub(/[\s　]+/," "), content: params[:post_content])
      if @post_image
        File.binwrite("public/post_images/#{@post.image_name}", @post_image.read)
        if (image_name_old != "default.jpg") & File.exist?("public/post_images/#{image_name_old}")
          File.delete("public/post_images/#{image_name_old}")
        end
      end
      redirect_to("/")
    else
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
    image_name_old = post.image_name
    if post.destroy
      @target_user.update(post_count: @target_user.posts.count)
      if (image_name_old != "default.jpg") & File.exist?("public/post_images/#{image_name_old}")
        File.delete("public/post_images/#{image_name_old}")
      end
    end
    
    redirect_to("/users/#{@target_user.name}")
  end
end
