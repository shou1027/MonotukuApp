class PostsController < ApplicationController
  def search
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post_image = params[:post_image]
    @post = @current_user.posts.build(title: params[:post_title], tags: params[:post_tag], content: params[:post_content])
    time = DateTime.now
    @post.image_name = @post_image.blank? ? "" : "#{@current_user.name + format("%04d%02d%02d%02d%02d%02d",time.year.to_s,time.month.to_s,time.day.to_s,time.hour.to_s,time.minute.to_s,time.second.to_s)}.jpg"
    if @post.save
      File.binwrite("public/post_images/#{@post.image_name}", @post_image.read)
      redirect_to("/")
    else
      render("posts/new")
    end
  end

  def edit
  end
end
