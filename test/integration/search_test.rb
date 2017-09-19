require 'test_helper'

class SearchTest < ActionDispatch::IntegrationTest
  test "search with empty title" do
    get search_path
    assert_template 'sessions/search'
    choose 'search_title'
    post search_path, params: { session: { search_title: "" } }
    assert_template 'sessions/search'
    assert_not flash.empty?
  end
end
