require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get posts_edit_url
    assert_response :success
  end

  test "should get search" do
    get posts_search_url
    assert_response :success
  end

end
