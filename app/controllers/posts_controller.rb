class PostsController < ApplicationController
  def search
  end
  
  def new
    @submit = "/posts/new"
    @post = Post.new
  end
  
  def create
    @post_image = params[:post_image]
    @post = @current_user.posts.build(title: params[:post_title], tags: params[:post_tags], content: params[:post_content])
    time = DateTime.now
    @post.image_name = @post_image.blank? ? "" : "#{@current_user.name + format("%04d%02d%02d%02d%02d%02d",time.year.to_s,time.month.to_s,time.day.to_s,time.hour.to_s,time.minute.to_s,time.second.to_s)}.jpg"
    if @post.save
      File.binwrite("public/post_images/#{@post.image_name}", @post_image.read)
      redirect_to("/")
    else
      @submit = "/posts/new"
      render("posts/new")
    end
  end

  def edit
    target_user
    @submit = "/posts/#{@target_user.name}/#{params[:id]}/update"
    @post = @target_user.posts.find_by(id: params[:id])
    render("posts/new")
  end
  
  def update
    target_user
    @post = @target_user.posts.find_by(id: params[:id])
    @post_image = params[:post_image]
    
    if @post_image
      time = DateTime.now
      @post.image_name = @post_image.blank? ? "" : "#{@current_user.name + format("%04d%02d%02d%02d%02d%02d",time.year,time.month,time.day,time.hour,time.minute,time.second)}.jpg"
    end
    
    if @post.update(title: params[:post_title], tags: params[:post_tags], content: params[:post_content])
      if @post_image
        File.binwrite("public/post_images/#{@post.image_name}", @post_image.read)
      end
      redirect_to("/")
    else
      @submit = "/posts/#{@current_user}/#{@post.id}/update"
      render("posts/new")
    end
  end
  
  def show
  end
  
  def destroy
    user = User.find_by(name: params[:user_name])
    user.posts.find_by(id: params[:id]).destroy
    redirect_to("/users/#{user.name}")
  end
end
