class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :title, {presence:true,length: {maximum: 100}}
  validates :image_name, {presence:true}
  validates :tags, {length: {maximum: 100}}
  validates :content, {length: {maximum: 10000}}
end
