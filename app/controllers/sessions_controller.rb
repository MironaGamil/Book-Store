class SessionsController < ApplicationController
  def search
  	if @book_items==nil
  		@book_items=[]
  	end
  end

  def post_search
  	if params[:session][:search]== "title"
      if params[:session][:search_title]==""
        flash[:danger]="title can't be empty!"  
      else
        @books= books_by_title params[:session][:search_title]

      end    

  	elsif params[:session][:search]== "author"
      if params[:session][:search_author]==""
        flash[:danger]="author can't be empty!" 
      else 
        @books= books_by_author params[:session][:search_author]
      end
    
  	else
      if params[:session][:search_publisher]==""
        flash[:danger]="publisher can't be empty!" 
      else
        @books= books_by_publisher params[:session][:search_publisher]
      end
      
  	end


    if !@books.nil?
      @book_items= @books.paginate(page: params[:page])
      render 'search'
    else
      @book_items=[]
      redirect_to search_path
    end
  	
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
    if(params[:session][:email]=="") || (params[:session][:password]=="")
      flash.now[:danger]="Email and password can't be empty!."
      render 'login'
    elsif (params[:session][:email]== ENV['EMAIL'])&&(params[:session][:password]== ENV['PASSWORD'] )
      log_in
      redirect_to root_url
    else
      flash.now[:danger]="Invalid email and pasword!."
      render 'login'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
