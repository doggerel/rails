class UsersController < ApplicationController
  before_filter :authenticate_user!
  def show
  end

  def index
    @users = User.all
  end

end
