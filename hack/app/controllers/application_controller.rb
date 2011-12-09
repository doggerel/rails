class ApplicationController < ActionController::Base
  include PostsHelper
  include UsersHelper
  protect_from_forgery

  def avatar_url(user)
    default_url = "#{root_url}images/guest.png"  
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase  
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"  
  end

  helper_method :avatar_url
end
