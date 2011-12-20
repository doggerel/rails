class CommentsController < ApplicationController
  respond_to :js, :html, :json
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  
     respond_to do |f| 
        f.html
        f.js{@post = params[:post]
        }
     end


  end

  def create
    id = params[:comment][:post]
    post = Post.find(id)
    params[:comment][:user_id] = current_user.id
    @comment = post.comments.build(params[:comment])

    if @comment.save
      redirect_to comments_url, 
      :notice => "Successfully created comment."
    else
      render :action => 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to comments_url, :notice  => "Successfully updated comment."
    else
      render :action => 'edit'
    end
  end
end
