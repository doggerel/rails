require 'digest'
#include ActiveRecord::Transitions
class User < ActiveRecord::Base
  acts_as_lucky
  include AASM
  attr_reader :search_tokens
#####Trick is to have a seperate controller to 
#return autocomplete results is this case
#the controller is searchings
  def search_tokens=(ids) 
    self.search_ids = ids.split(",")
  end
  
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
  
  has_many :messages, :dependent => :destroy
  has_many :messages, :foreign_key => "message_to_id",
           :class_name => "Message",
           :dependent => :destroy
  has_many :messages_to, :through => :reverse_messages, :source => :message_to
                        
###=======================User===========================================  

          
  attr_accessible :name, :email, :password, :password_confirmation, :handle, :notify
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :name, :presence => true,
                    :length =>{:maximum => 50}
   validates :handle, :presence => true,
                      :length => {:minimum => 4, :maximum => 25}
   
   validates :email, :presence=>true,
                     :format =>{:with=>email_regex},
                     :uniqueness => {:case_sensitive=>false}
  validates_presence_of  :password, :on => :create
   validates :password, :presence => true,
     :confirmation => true,
     :length  => {:within=> 6..40}
   
   before_save :encrypt_password
   before_create{generate_token(:auth_token)}
   before_create{generate_token(:confirmation_token)}
 #==============Code=======================  

 aasm_state :unconfirmed
 aasm_state :confirmed
 aasm_event :morph do
   transitions :to => :confirmed, :from=>[:unconfirmed]
 end
 aasm_event :demorph do
   transitions :to => :unconfirmed, :from=>[:confirmed]
 end
########Sunspot config######### 
######################
 searchable do
   text :name
   text :handle
   ###############rake sunspot:reindex
   #--------------rake sunspot:solr:start
   
 end
   
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
    def names
      @names = User
    end
    def messages_from
      Message.messages_from(self)
    end
    def messages_to
      Message.messages_to(self)
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
     Message.messages_from(self)
   end
  def notification_status
    @status = ""
    if notify?
      @status = "cancel all email notifications"
    else
      @status = "Please send me email notifications"
    end
  end
   def confirm_user
     self.email_confirmed = true
      save!(:validate=>false)
   end

   def follow!(followed)

     relationships.create!(:followed_id => followed.id)
   end
   def unfollow!(followed)
     relationships.find_by_followed_id(followed).destroy
   end
   def send_password_reset
     generate_token(:password_reset_token)
     self.password_reset_sent_at = Time.zone.now
     save!(:validate=>false)
     UserMailer.password_reset(self).deliver
   end
   def send_email_confirmation
     generate_token(:confirmation_token)
     self.confirmed_at = Time.zone.now 
     save!(:validate=>false)
     UserMailer.confirm_email(self).deliver
   end
   
   private
    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end
    
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
