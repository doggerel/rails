class NewsController < ApplicationController
  respond_to :rss
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
end

