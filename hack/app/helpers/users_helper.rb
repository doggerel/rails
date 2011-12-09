module UsersHelper
  

def avatar_url(user)
  if user.avatar_url.present?
    user.avatar_url
  else
    default_url = "#{root_url}images/guest.png"
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
  end
end
  
  def gravatar_for(user, options ={:size => 50})
    gravatar_image_tag(user.email.downcase, :alt => user.email,
                                            :class => 'gravatar',  
                                            :gravatar => options)
  end
  def gravatar_tag(email,*args)
    opts = args.extract_options!
    opts[:class]||=""
    opts[:class]+=" gravatar"
    size = opts.delete(:size) || 80
    require 'digest/md5'
    
    default=""
    if opts[:default]
      require 'cgi'
      default= "&d=#{CGI::escape(opts.delete(:default))}"
    end
    hash = Digest::MD5.hexdigest(email.downcase)
    img= image_tag "http://www.gravatar.com/avatar/#{hash}?size=#{size}#{default}", opts
    if opts[:profile]
      opts.delete(:profile)
      link_to img,"http://www.gravatar.com/#{hash}",opts
    else
      img
    end
  end

end
