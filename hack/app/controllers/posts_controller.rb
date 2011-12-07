class PostsController < ApplicationController
  respond_to :js, :html
  before_filter :authenticate_user!
  def index
    @post = current_user.posts.last
  end
  def show
    @post = Post.find(params[:id])
    respond_with(:js)

  end

  def destroy
  end

  def new
  end

end
