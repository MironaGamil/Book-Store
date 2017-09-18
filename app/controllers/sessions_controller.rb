class SessionsController < ApplicationController
  def search
  	if @book_items==nil
  		@book_items=[]
  	end
  end

  def post_search
  	if params[:session][:search]== "title"
  		@books= books_by_title params[:session][:search_title]
      

  	elsif params[:session][:search]== "author"
      @books= books_by_author params[:session][:search_author]
    
  	else
      @books= books_by_publisher params[:session][:search_publisher]
      
  	end

    @book_items= @books.paginate(page: params[:page])
    render 'search'
  	
  end

  def books_by_title (title)
    Book.where("title like ?", "%#{title}%")  
  end

  def books_by_author (author)
    book_ids=Author.where("name like ?", "%#{author}%").select(:book_id)
    Book.where("id IN (?)", book_ids )  
  end

  def books_by_publisher (publisher)
    Book.where("publisher like ?", "%#{publisher}%")  
  end



  def login
  end

  def post_login
    if (params[:session][:email]== ENV['EMAIL'])&&(params[:session][:password]== ENV['PASSWORD'] )
      log_in
      redirect_to root_url
    else
      redirect_to login_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
