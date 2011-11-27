class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :post
  default_scope :order =>'posts.created_at DESC'
end
