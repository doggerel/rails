class UsersController < ApplicationController
  before_filter :authenticate, :except =>[:show,:new,:create]
  before_filter :correct_user, :only=>[:edit,:update]
  before_filter :admin_user, :only=> :destroy
  before_filter :signed_in_user, :only => [:new, :create]
  
  def index 
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end
  
  def new
    @title = "Sign up"
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.name
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      @title = 'Edit user'
      render 'edit'
    end
  end
  def destroy
    user = User.find(params[:id])
    if self_and_admin?(user)
      user.destroy
      flash[:success] = "User destroyed."
      redirect_to users_path
    else
      flash[:notice] = "An admin user attemped self destruction"
      redirect_to root_path
    end
  end
  def following
    show_follow(:following)
  end
  def followers
    show_follow(:followers)
  end
  
  private

  def show_follow(action)
   @title = action.to_s.capitalize 
   @user = User.find(params[:id])
   @users = @user.send(action).paginate(:page => params[:page])
   render 'show_follow'
  end
  
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless  current_user?(@user)
  end
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
  
  def self_user?(user)
    user == current_user
  end
  def self_and_admin?(user)
    if (self_user?(user) and current_user.admin?)
      return false 
    else
      true
    end
  end

  
  def signed_in_user
    redirect_to(root_path) unless !signed_in?
     where_you_were = split_path(request.fullpath)
    flash[:notice] = "You have no need to access that page #{where_you_were}"
  end 
end
