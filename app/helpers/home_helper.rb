module HomeHelper
  def following_works
    posts = nil
    if @current_user.passive_relationships
      following = @current_user.following
      if !following.blank?
        following.each.with_index do |followed,i|
          if i == 0
            posts = followed.posts
          else
            posts = posts.or(followed.posts)
          end
        end
      end
    end
    return posts
  end
  
  def tag_works
    posts = nil
    if !@current_user.tags.blank?
      tags = @current_user.tags.split(/ /)
      tags.each_with_index do |tag,i|
        if i == 0
          posts = Post.where("tags ILIKE ?","%#{tags[0]}%")
        else
          posts = posts.or(Post.where("tags ILIKE ?","%#{tag}%"))
        end
      end
    end
    return posts
  end
end
