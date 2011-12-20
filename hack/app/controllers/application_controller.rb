class ApplicationController < ActionController::Base
  include PostsHelper
  include UsersHelper
  protect_from_forgery

  def avatar_url(user)
    default_url = "#{root_url}images/guest.png"  
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase  
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"  
  end
  def snippet(thought, wordcount)
    thought.split[0..(wordcount-1)].join(" ") +(thought.split.size > wordcount ? "..." : "")
  end 
  def year_month
    a = Post.year_month
    h = a.group_by { |x| x['y'] }.each_with_object({}) do |(y,v), h|
    h[y.to_i] = Hash[v.map { |e| [e['m'].to_i, e['c'].to_i] }]
    # {2010 => {11 => 23}, 2011 => {1 => 1, 3 => 5, 4 => 2, 8 => 11}} 
  end
    
end

  helper_method :avatar_url
  helper_method :snippet
  helper_method :year_month
end
