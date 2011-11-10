class SearchingsController < ApplicationController
  def new
    @user = User.new
  end
  def index
    @users = User.where("name like ? or handle like ?",
                       "%#{params[:q]}%","%#{params[:q]}%") 
    respond_to do |format|
      format.html
      format.json{render :json => @users.map(&:attributes)}
    end
  end
end
