module UsersHelper
  def gravatar_for(user, options ={:size => 50})
    gravatar_image_tag(user.email.downcase, :alt => user.email,
                                            :class => 'gravatar',  
                                            :gravatar => options)
  end
  def split_path(full_path)
    arr = full_path.split(/\//) 
    return_string = sensible_names(arr[-1])
  end
  private
  def sensible_names(str)
    case str
    when "new"
      "you are already a member"
    else
      "what the heck is going on"
    end
  end
end
