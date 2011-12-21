class PostsController < ApplicationController
  respond_to :js, :html
  before_filter :authenticate_user!
  def index
    @post = current_user.posts.last
    @comment =  Comment.where(:post_id => @post).all
  end
  def new
    @post = Post.new
    respond_with(:html)
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |f|
      f.html
      f.js
    end
  end

   def edit
     @post = Post.find(params[:id])
     @title = 'Edit Post'
   end
   def create
     @post = Post.new(params[:post])
     if @post
       render root_path
     else
       flash[:error] = "there was a problem creating your post"
     end
   end
   def user_posts_all
     @user = User.find(params[:id])
     @posts = @user.posts.all
   end
   def post_by_title
     @post = Post.find(params[:id]) 
   end
  
   def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    flash[:success] ="your post #{@post.title} has been successfully updated"
    redirect_to root_path
  end
   def return_post
     respond_to do |f|
      f.js{@post = Post.find(params[:id])}
     end
   end
  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post destroyed."
    redirect_to posts_path
  end


  def new
  end

end
