class Micropost < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :in_reply_to
  default_scope :order => 'microposts.created_at DESC'
  scope :from_users_followed_by, lambda { |user|  followed_by(user) }
  scope  :from_replied_to, lambda{|user| replied_to_posts(user)}
  validates :content, :presence => true, :length =>{:maximum => 140}
  validates :user_id, :presence => true

  private
  def self.followed_by(user)
    following_ids = %(SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id)
    where("user_id IN (#{following_ids}) OR user_id = :user_id",
          {:user_id =>user})                 
  end
  def self.replied_to_posts(user)
    replies = self.where(:in_reply_to => user)
  end
end
