require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
	def setup
      @book = books(:one)
      @author = Author.new(name: "Ali", book_id: @book.id)
    end

    test "should be valid" do
		assert @author.valid?
	end

	test "book id should be present" do
		@author.book_id = nil
	    assert_not @author.valid?
	end

	test "name should be present" do
	    @author.name = "   "
	    assert_not @author.valid?
	end

	test "name should be at most 50 characters" do
	    @author.name = "a" * 51
	    assert_not @author.valid?
	end


end
