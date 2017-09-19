require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/login'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/login'
    assert_not flash.empty?
  end

  test "login with invalid email" do
    get login_path
    assert_template 'sessions/login'
    post login_path, params: { session: { email: "miro@ex.com", password: "admin" } }
    assert_template 'sessions/login'
    assert_not flash.empty?
  end

  test "login with invalid password" do
    get login_path
    assert_template 'sessions/login'
    post login_path, params: { session: { email: "mirona@gmail.com", password: "123456" } }
    assert_template 'sessions/login'
    assert_not flash.empty?
  end

  test "login with valid information" do
    get login_path
    assert_template 'sessions/login'
    post login_path, params: { session: { email: "mirona@gmail.com", password: "admin" } }
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", logout_path
  end

  test "login then logout" do
    get login_path
    assert_template 'sessions/login'
    post login_path, params: { session: { email: "mirona@gmail.com", password: "admin" } }
    assert_redirected_to root_url
    delete logout_path
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
  end




end
