class UsersController < ApplicationController
  before_filter :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def index

    @users = User.all.paginate(:page=>params[:page])
  end
  def followers
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page=>params[:page])
    render 'show_follow'
                                      
  end

end
