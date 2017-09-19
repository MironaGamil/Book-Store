require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should not get new" do
    get new_book_url
    assert_redirected_to login_url
  end

  test "should not create book" do
    assert_no_difference('Book.count') do
      post books_url, params: { book: { ISBN: @book.ISBN, publish_date: @book.publish_date, publisher: @book.publisher, title: @book.title } }
    end

    assert_redirected_to login_url
  end

  test "should not show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should not get edit" do
    get edit_book_url(@book)
    assert_redirected_to login_url
  end

  test "should not update book" do
    patch book_url(@book), params: { book: { ISBN: @book.ISBN, publish_date: @book.publish_date, publisher: @book.publisher, title: @book.title } }
    assert_redirected_to login_url
  end

  test "should not redirect destroy" do
    assert_no_difference 'Book.count' do
      delete book_path(@book)
    end
    assert_redirected_to login_url
  end




  test "should get new when admin login" do
    get login_path
    post login_path, params: { session: { email: "mirona@gmail.com", password: "admin" } }
    assert_redirected_to root_url
    get new_book_url
    assert_response :success  
  end

  test "should create book when admin login" do
    get login_path
    post login_path, params: { session: { email: "mirona@gmail.com", password: "admin" } }
    assert_redirected_to root_url

    assert_no_difference('Book.count') do
      post books_url, params: { book: { ISBN: @book.ISBN, publish_date: @book.publish_date, publisher: @book.publisher, title: @book.title } }
    end
    assert_response :success  
  end

  test "should get edit when admin login" do
    get login_path
    post login_path, params: { session: { email: "mirona@gmail.com", password: "admin" } }
    assert_redirected_to root_url
    get edit_book_url(@book)
    assert_response :success  
  end

  test "should update book when admin login" do
    get login_path
    post login_path, params: { session: { email: "mirona@gmail.com", password: "admin" } }
    assert_redirected_to root_url
    patch book_url(@book), params: { book: { ISBN: @book.ISBN, publish_date: @book.publish_date, publisher: @book.publisher, title: @book.title } }
    assert_redirected_to book_url(@book)
  end

  test "should redirect destroy when admin login" do
    get login_path
    post login_path, params: { session: { email: "mirona@gmail.com", password: "admin" } }
    assert_redirected_to root_url

    assert_difference('Book.count', -1) do
      delete book_path(@book)
    end
    assert_redirected_to books_path
  end


  


end
