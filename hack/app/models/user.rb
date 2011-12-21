class User < ActiveRecord::Base
  has_many :posts, :dependent=>:destroy
  has_many  :relationships, :foreign_key => 'follower_id',
                            :dependent => :destroy
  
  has_many :reverse_relationships, :foreign_key=>"followed_id",
                                   :class_name=>"Relationship",
                                   :dependent=>:destroy  
  
  has_many :followers, :through => :reverse_relationships, :source=> :follower                                 

  
  has_many :following, :through => :relationships, :source => :followed
#  has_and_belongs_to_many :roles
  has_many :comments
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :handle
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
  def following?(followed)
    relationships.find_by_followed_id(followed)
  end
  def follow!(followed)
    relationships.create!(:followed_id=>followed.id)
  end
  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end
end
