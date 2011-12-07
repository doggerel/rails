class PostsController < InheritedResources::Base
  before_filter :authenticate, :only=>[:create,:destroy]
  before_filter :authorized_user, :only=> :destroy
  def new
  end

  def show
  end

  def index
  end

  def update
  end

  def destroy
  end

  private
  def authorized_user
    @post = current_user.micropposts_find_by_id(params[:id])
    redirect_to root_path if @posts.nil?
  end
end
