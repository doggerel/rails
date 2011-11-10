require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  #=================Microposts========================
  has_many :microposts, :dependent => :destroy
  ###==========Relationships=========================
  
  has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy 
  has_many :following, :through => :relationships, :source => :followed
  
  has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower

  ###==================Messages
  
  has_many :messages,  :dependent => :destroy 
                        
   
  #####================User
  
  attr_accessible :name, :email, :password, :password_confirmation, :handle
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :name, :presence => true,
                    :length =>{:maximum => 50}
   validates :handle, :presence => true,
                      :length => {:minimum => 4, :maximum => 25}
   
   validates :email, :presence=>true,
                     :format =>{:with=>email_regex},
                     :uniqueness => {:case_sensitive=>false}
   
   validates :password, :presence => true,
     :confirmation => true,
     :length  => {:within=> 6..40}
   
   before_save :encrypt_password
   
   def has_password?(submitted_password)
     encrypted_password == encrypt(submitted_password)
   end
    def feed
      Micropost.from_users_followed_by(self)
    end

    def replies
      Micropost.from_replied_to(self)
    end
    def feed_and_replies
      f1 = feed
      f2 = replies
      f3 = f2 + f1
      return f3
    end

   def self.authenticate(email, submitted_password)
     user = find_by_email(email) || find_by_handle(email)
     return nil if user.nil?
     return user if user.has_password?(submitted_password)
   end
   
   def self.authenticate_with_salt(id,cookie_salt)
     user = find_by_id(id)
     (user && user.salt == cookie_salt) ? user : nil
     # above line equivalent to
     # return nil if user.nil?
     # return user if user.salt == cookie_salt
   end
   def following?(followed)  
     relationships.find_by_followed_id(followed)
   end
   def message
     Message.messages_from_users(self)
   end

   def follow!(followed)
     relationships.create!(:followed_id => followed.id)
   end
   def unfollow!(followed)
     relationships.find_by_followed_id(followed).destroy
   end
   private
    
   def encrypt_password
      self.salt = make_salt if  new_record?
      self.encrypted_password = encrypt(password)
    end
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
   #user.errors.full_messages

end
