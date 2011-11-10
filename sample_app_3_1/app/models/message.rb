class Message < ActiveRecord::Base
  belongs_to :user
  attr_accessible :to, :message
  validates :user_id, :presence => true
  validates :to, :message, :presence => true
  scope :messages_from_users, lambda{|user| message_for_user(user)}
private
    def self.message_for_user(user)
       messages = self.where(:to => user)
    end
end
