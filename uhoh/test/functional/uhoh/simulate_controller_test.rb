require 'test_helper'

module Uhoh
  class SimulateControllerTest < ActionController::TestCase
    test "should get failure" do
      get :failure
      assert_response :success
    end
  
  end
end
