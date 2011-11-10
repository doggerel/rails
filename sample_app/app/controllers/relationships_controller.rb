class RelationshipsController < ApplicationController
  before_filter :authenticate
  def create
    @user = User.find(params[:relationship][:followed_id])
    UserMailer.follower_notification(@user).deliver unless !current_user.notify?
    current_user.follow!(@user)
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
   end


  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    
    end
  end
end
