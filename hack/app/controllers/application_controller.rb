class ApplicationController < ActionController::Base
  include PostsHelper
  include UsersHelper
  protect_from_forgery

  def avatar_url(user)
    default_url = "#{root_url}images/guest.png"  
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase  
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=identicon&s=48"  
  end
  def snippet(thought, wordcount)
    thought.split[0..(wordcount-1)].join(" ") +(thought.split.size > wordcount ? "..." : "")
  end 
  def arr_to_string(snip)
    str = ''
    snip.each do |i|
      str += i + " "
    end
    str
  end
  
  def str_to_array(paragraph)
    arr = paragraph.blank? ? [""] : paragraph.split(' ').collect(&:strip)
  end
  def snippet_range(paragraph,start, finish)
    arr = str_to_array(paragraph)
    snip = arr[start..finish]
    arr_to_string(snip) + "..."
  end
    
  def admin?
    current_user.admin?
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
  helper_method :snippet_range
  helper_method :admin
end
