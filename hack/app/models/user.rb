class User < ActiveRecord::Base
  has_many :posts
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
end
