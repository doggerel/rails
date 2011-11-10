class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
  def index
    @user = User.find(params[:user_id])
    @microposts = @user.microposts.paginate(:page => params[:page])

  end

  def create
      @post = params[:micropost]
      content = params[:micropost][:content]
      @post = find_user_by_handle(@post) unless !is_prefixed?(content, "@")
      if message_conditional(content)
        create_message(message_extraction(content))
      else
      @micropost = current_user.microposts.build(@post)
      if @micropost.save
        flash[:success] = "Micropost created !!!"
        redirect_to root_path
      else
        @feed_items = []
        render 'pages/home'
      end
    end
  end
  def create_message(args)
    hash = Hash.new
    params[:micropost].delete(:content)
    params[:micropost].merge({:message => args[1]})
    params[:micropost].merge(:to=>args[0])
    user_id = User.where(:handle => args[0])
    debugger
    user = User.find(user_id[0])
    hash = { :to => user.id,
             :message => args[1]
          }
     @message = current_user.messages.build(hash)
     if @message.save!
      flash[:success] = "Message Sent"
      redirect_to root_path
     else
       flash[:error] = "there was a problem with your message"
       redirect_to user_path
     end
    
    
    #filler until later
  end
  def destroy
    @micropost.destroy
    redirect_back_or root_path
  end
  private
   
  def find_message_recipient_by_handle(hash)
    user = User.where(:handle => hash[0])
    user.messages.build(hash[1])
    flash[:success] = "message successfully sent"
    redirect_to current_user
  end

  
  
  
  def find_user_by_handle(hash)
    content = hash{:content}
    str = extract_handle(content) #micropost helper for obtaining user's handle
     user = User.where(:handle => str)
     if user.blank?
       no_user(content)
     else
       return return_hash(user,hash)
    end
  end
    
    def return_hash(user,hash) #append to :replied_to to the params hash
      @user = User.find(user)
      hash.merge!({:in_reply_to => @user.id})
      return hash
    end
    

  def authorized_user
    @micropost = current_user.microposts.find_by_id(params[:id])
    redirect_to root_path if @micropost.nil?
  end
  
  def no_user(content)
    flash[:error] = "no user #{extract_handle(content).to_s} listed"
    return false
  end


end
