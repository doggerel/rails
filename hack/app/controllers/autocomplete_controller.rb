class AutocompleteController < ApplicationController
  def title
     if params[:term]
       like  = "%".concat(params[:term].concat("%"))
       posts = Post.order(:title).where("title like ?", like)
     else
       posts = Post.order(:title).all
     end
     list = posts.map {|u| Hash[id: u.id, label: u.title, title: u.title]}
     render json: list            
   end
end
