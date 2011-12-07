class PusherController < ApplicationController
  def auth
    # There's only one channel in this simple demo so we can hard code it
    raise "Unknown channel" unless params[:channel_name] == 'presence-demo'
    channel = Pusher['presence-demo']
    if identity = session[:identity]
      response = channel.authenticate(params[:socket_id], {
        :user_id => session[:session_id],
        :user_info => {
          :gravatar => identity[:gravatar]
        }
      })
      render :json => response
    else
      # We're allowing anonymous users
      response = channel.authenticate(params[:socket_id], {
        :user_id => session[:session_id] || rand(100000),
        :user_info => {}
      })
      render :json => response

      # You might alternatively want to deny them:
      # render :text => "Not authorized", :status => '403'
    end
  end
end
