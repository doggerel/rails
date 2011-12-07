class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  #######===================================User
  has_many :posts, :dependent => :destroy
  attr_accessor :search
  attr_accessible :password, :email, :password_confirmation,:name,:handle
  has_secure_password
  validates_presence_of :password, :on => :create
  self.per_page = 10
  searchable :auto_index =>true, :auto_remove => true do
    text :name, :boost => 2
    text :posts_post do
      posts.post
    end
  end
end
