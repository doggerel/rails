class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :message_to, :class_name =>"User"
  attr_accessible :message_to_id, :message
  validates :user_id, :presence => true
  validates :message_to_id, :message, :presence => true
  scope :messages_from, lambda{|user| message_for_user(user)}
  scope :messages_to, lambda{|user| message_to_user(user)}
private
    def self.message_for_user(user)
       messages = self.where(:message_to_id => user)
    end
    def self.message_to_user(user)
      message = self.where(:user_id => user)
    end
end
