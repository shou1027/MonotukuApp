require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get home_home_url
    assert_response :success
  end

#  test "should get help" do
#    get "/help"
#    assert_response :success
#  end

#  test "should get home" do
    #get home_home_url
    #assert_response :success
#  end

end
