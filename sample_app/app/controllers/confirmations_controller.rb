class ConfirmationsController < ApplicationController
  def show 
    user = User.find_by_confirmation_token(params[:id])
   if user
     user.morph
    redirect_to root_path, :notice => "you now have access to all the sites features" unless !user.save!(:validate=>false) 
   else
    redirect_to root_path, :notice => "unable to confirm you email at this time"
    end
  end
end
