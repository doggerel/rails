require 'spec_helper'

describe "Users" do
  describe "signup" do
    describe "failure"do
      it "should no make a new user" do
        lambda do
          visit signup_path 
          puts response.body
          fill_in "name", :with =>""
          fill_in "email", :with =>""
          fill_in "password", :with =>""
          fill_in "Confirmation", :with =>""
          click_button
          response.should render_template('users/new')
          response.should have_selector('div#error_explanation')
        end.should_not change(User, :count)
      end
    end
    describe "success" do
      it "should create a new user" do
        lambda do
          visit signup_path 
          puts response.body
          fill_in "Name",    :with => "Example User" 
          fill_in  "Email",  :with => "user@example.com"
          fill_in "Password",:with => "foobar"
          fill_in "Confirmation", :with => "foobar"
          click_button
          response.should have_selector("div.flash.success",
                                        :content =>"Welcome")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)

        end
      end
      

     describe "sign in/out" do
       it "should not sign a user in" do
         visit signin_path
         fill_in :email, :with =>""
         fill_in :password, :with =>"" 
         click_button
         response.should have_selector("div.flash.error", :content =>"invalid")

       end
     end
     describe "success" do
       it "should sign a user in and out" do
         user = Factory(:user)
         integration_sign_in(user)
          controller.should be_signed_in
      end
    end
  end
end
  

