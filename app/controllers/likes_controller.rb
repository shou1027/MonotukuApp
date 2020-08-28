class LikesController < ApplicationController
  def like
    target_user
    @current_user.user_likes.create(post_id: params[:id])
    redirect_to("/posts/#{@target_user.name}/#{params[:id]}")
  end

  def unlike
    target_user
    @current_user.user_likes.find_by(post_id: params[:id]).destroy
    redirect_to("/posts/#{@target_user.name}/#{params[:id]}")
  end
end
