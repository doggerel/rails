class User < ActiveRecord::Base
  #######===================================User
  has_many :posts, :dependent => :destroy
  attr_accessible :password, :email, :password_confirmation,:name,:handle
  has_secure_password
  validates_presence_of :password, :on => :create
  self.per_page = 10
end
