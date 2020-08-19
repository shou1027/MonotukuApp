class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :image_name
      t.string :user_name

      t.timestamps
    end
  end
end
