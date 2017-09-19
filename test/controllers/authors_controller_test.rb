require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:one)
  end

  test "should get index" do
    get authors_url
    assert_response :success
  end

  test "should get new" do
    get new_author_url
    assert_redirected_to login_url
  end

  test "should create author" do
    assert_no_difference('Author.count') do
      post authors_url, params: { author: { book_id: @author.book_id, name: @author.name } }
    end

    assert_redirected_to login_url
  end

  test "should show author" do
    get author_url(@author)
    assert_response :success
  end

  test "should get edit" do
    get edit_author_url(@author)
    assert_redirected_to login_url
  end

  test "should update author" do
    patch author_url(@author), params: { author: { book_id: @author.book_id, name: @author.name } }
    assert_redirected_to login_url
  end

  test "should destroy author" do
    assert_no_difference('Author.count', -1) do
      delete author_url(@author)
    end

    assert_redirected_to login_url
  end



  test "should get new when admin login" do
    get login_path
    post login_path, params: { session: { email: "mirona@gmail.com", password: "admin" } }
    assert_redirected_to root_url
    get new_author_url
    assert_response :success  
  end

  test "should create author when admin login" do
    get login_path
    post login_path, params: { session: { email: "mirona@gmail.com", password: "admin" } }
    assert_redirected_to root_url

    assert_difference('Author.count') do
    post authors_url, params: { author: { book_id: @author.book_id, name: @author.name } }
    end
    assert_redirected_to author_url(Author.last)
  end

  test "should get edit when admin login" do
    get login_path
    post login_path, params: { session: { email: "mirona@gmail.com", password: "admin" } }
    assert_redirected_to root_url
    get author_url(@author)
    assert_response :success  
  end

  test "should update book when admin login" do
    get login_path
    post login_path, params: { session: { email: "mirona@gmail.com", password: "admin" } }
    assert_redirected_to root_url
    patch author_url(@author), params: { author: { book_id: @author.book_id, name: @author.name } }
    assert_redirected_to author_url(@author)
 end

  test "should redirect destroy when admin login" do
    get login_path
    post login_path, params: { session: { email: "mirona@gmail.com", password: "admin" } }
    assert_redirected_to root_url

    assert_difference('Author.count', -1) do
      delete author_url(@author)
    end
    assert_redirected_to authors_path
  end
end
