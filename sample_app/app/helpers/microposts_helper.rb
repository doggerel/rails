module MicropostsHelper
  def wrap(content)
    sanitize(raw(content.split.map{ |s| wrap_long_string(s) }.join(' ')))
  end
  def message_conditional(message)
  #  #{Regexp.escape(variable)}
    messageRe = /\Ad{1}\s+/
      regEx = messageRe.match(message)
    end
  end

  def input_extraction(post,type, ch)
    regexp = /\A(#{Regexp.escape(ch)}{1})(\s*)([\w |\W]+)(\s+)([\w\W]+)\z/
    match =  regexp.match(post)
    
    ret = case type
      when "handle" then match[3]
      when "content" then match[5]
      else "no such type"
    end
    ret
  end
  
  def message_extraction(message,bool=nil)
      messageRe = 
        /\A((d{1}\s+)(\w+\W*\d*)(\s+))(...*)/
    regEx = messageRe.match(message)
    array = [regEx[3],regEx[5]]
    return array
    #need to extract name search for name
    #create :to and :user_id
  end

  def extract_handle(post)
    m = post.to_s.split(" ")
    b = m[0].to_s[1..m[0].length]
    return b
  end
  
  def define_regexp(post,ch)
     postRe = /(#{Regexp.escape(ch)}){1}(\w+)/
     m = postRe.match(post)
  end
  
  
  def is_prefixed?(post,ch=nil)
     handle = post.split(/ /) #split post into user handle and message
     charray = handle[0].split(//) #split handle array into characters
     unless charray[0] == ch 
       false
       else
       m = define_regexp(handle[0],ch)
       if m[1].to_s == ch.to_s
         true
       else
          false
       end
     end
  end


  private

    def wrap_long_string(text, max_width = 30)
      zero_width_space = "&#8203;"
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text : 
                                  text.scan(regex).join(zero_width_space)
    end

