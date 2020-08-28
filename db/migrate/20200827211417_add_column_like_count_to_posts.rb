class AddColumnLikeCountToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :like_count, :integer
  end
end
