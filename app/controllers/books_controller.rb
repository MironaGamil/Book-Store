class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_admin, only: [:create, :destroy, :update, :new, :edit]

  # GET /books
  # GET /books.json
  def index
    @books = Book.paginate(page: params[:page])
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    @book.authors.build
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book }
        format.json { render :show, status: :created, location: @book }
        flash[:success] ="Book was successfully created."
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params) 
        format.html { redirect_to @book}
        format.json { render :show, status: :ok, location: @book }
        flash[:success]="Book was successfully updated."
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
      flash[:success]="Book was successfully destroyed."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :publisher, :ISBN, :publish_date, :authors_attributes => [:id, :name])
    end

    def author_params
      params.require(:book).permit(:id, :name)
    end

end
