class ApplicationController < ActionController::Base
  protect_from_forgery
  Pusher.app_id = '10912'
  Pusher.key = '244a62c4217eb601c81d'
  Pusher.secret = '576806e088ad76f7693e'
  helper :all # include all helpers, all the time
  private
  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end
  def current_user?(user)
    user == @current_user
  end
  def current_user=(user)
    @current_user = user
  end
  def signed_in?
    !current_user.nil?
  end
  def sign_in(user)
    session[:user_id] = user.id
    self.current_user = user
  end 
  def deny_access
    store_location
    redirect_to signin_path, :notice=>"Please sign in to access this page"
  end
  def authenticate
    deny_access unless signed_in?
  end
  def store_location
    session[:return_to] = request.fullpath
  end
  def gravatar_for(user, options ={:size => 50})
    gravatar_image_tag(user.email.downcase, :alt => user.email,
                                            :class => 'gravatar',  
                                            :gravatar => options)
  end

  helper_method :current_user
  helper_method :current_user?
  helper_method :signed_in?
  helper_method :sign_in
  helper_method :authenticate
  helper_method :gravatar_for
end
