require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get search_path
    assert_response :success
  end

  test "should get login" do
    get login_path
    assert_response :success
  end
end
