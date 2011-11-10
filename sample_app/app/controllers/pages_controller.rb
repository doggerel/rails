class PagesController < ApplicationController
  def home
      @title = "Home"
      if signed_in?
        @micropost = Micropost.new
        @feed_items = 
        current_user.feed_and_replies.paginate(:page=>params[:page])
        @message_feed = current_user.messages_from

      end
  end

  def contact
      @title = "Contact"
  end

  def about
      @title = "About"
  end
  def help
      @title = "Help"
  end	

end
