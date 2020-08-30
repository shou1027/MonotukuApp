class LikesController < ApplicationController
  before_action :allow_logged_in
  
  def like
    target_user
    @post = Post.find_by(id: params[:id])
    @current_user.user_likes.create(post_id: @post.id)
    @post.update(like_count: @post.post_likes.count)
    redirect_to("/posts/#{@target_user.name}/#{@post.id}")
  end

  def unlike
    target_user
    @post = Post.find_by(id: params[:id])
    @current_user.user_likes.find_by(post_id: params[:id]).destroy
    @post.update(like_count: @post.post_likes.count)
    redirect_to("/posts/#{@target_user.name}/#{params[:id]}")
  end
end
