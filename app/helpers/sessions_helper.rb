module SessionsHelper
	def books_by_title (title)
		Book.where("title like ?", "%#{title}%")	
	end
	def books_by_publisher (publisher)
		Book.where("publisher like ?", "%#{publisher}%")	
	end
end
