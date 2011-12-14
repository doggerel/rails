class Comment < ActiveRecord::Base
  attr_accessible :user_id, :post_id, :comment
  belongs_to :user
  belongs_to :posts, :dependent => :destroy
  attr_accessible :user_id, :comment
end
