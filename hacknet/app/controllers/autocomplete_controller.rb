class AutocompleteController < ApplicationController
  def users
     if params[:term]
       like  = "%".concat(params[:term].concat("%"))
       users = User.order(:name).where("name like ?", like)
     else
       users = User.order(:name).all
     end
     list = users.map {|u| Hash[id: u.id, label: u.name, name: u.name]}
     render json: list            
   end
end
