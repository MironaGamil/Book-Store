class SessionsController < ApplicationController
  def search
  	if @book_items==nil
  		@book_items=[]
  	end
  end

  def post_search
  	if params[:session][:search]== "title"
  		@books= books_by_title params[:session][:search_title]
      @book_items= @books.paginate(page: params[:page])
  		render :search
  	elsif params[:session][:search]== "author"

  	else
      @books= books_by_publisher params[:session][:search_publisher]
      @book_items= @books.paginate(page: params[:page])
      render :search

  	end
  	
  end
end
