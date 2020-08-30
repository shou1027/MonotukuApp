class RelationshipsController < ApplicationController
  before_action :allow_logged_in
  
  def follow
    target_user
    @target_user.active_relationships.create(followed_id: @current_user.id)
    redirect_to("/users/#{@target_user.name}")
  end

  def unfollow
    target_user
    @target_user.active_relationships.find_by(followed_id: @current_user.id).destroy
    redirect_to("/users/#{@target_user.name}")
  end
end
