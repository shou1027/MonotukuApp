class User < ApplicationRecord
  validates :name, {presence:true,uniqueness:true,length: {maximum: 30}}
  validates :password, {presence:true,length: {minimum: 6, maximum: 30}}
  validates :tags, {length: {maximum: 100}}
end
