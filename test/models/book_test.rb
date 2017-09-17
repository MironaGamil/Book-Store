require 'test_helper'

class BookTest < ActiveSupport::TestCase
	def setup
		@book = Book.new(title: "Book", publisher: "publisher", ISBN: "123456", publish_date: '1970-01-01' )
	end
	test "book should be valid" do
		assert @book.valid?
	end

	test "title should be present" do
		@book.title="       "
		assert_not @book.valid?
	end

	test "publisher should be present" do
		@book.publisher="       "
		assert_not @book.valid?
	end

	test "ISBN should be present" do
		@book.ISBN="       "
		assert_not @book.valid?
	end

	test "publish date should be present" do
		@book.publish_date="       "
		assert_not @book.valid?
	end

	test "title should be less than 101" do
		@book.title="m"* 101
		assert_not @book.valid?
	end

	test "publisher should be less than 51" do
		@book.publisher="m"* 51
		assert_not @book.valid?
	end

	test "books sorted by newest" do
		assert_equal books(:most_recent), Book.first
	end

end
