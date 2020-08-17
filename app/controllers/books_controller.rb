class BooksController < ApplicationController
  
  def show
  	@book = Book.find(params[:id])
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
    flash[:notice] = "successfully"
   # redirect_to book_path#成功の場合
    redirect_to("/books/#{@book.id}")
    else 
    flash[:notice] = "error"
    render 'index' #失敗の場合 
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    @books = Book.all
    if @book.save
    flash[:notice] = "successfully"
    redirect_to("/books/#{@book.id}") #成功の場合
    else   
    flash[:notice] = "error"     
    render 'index' #失敗の場合 
    end
  end



  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private 
  def book_params
    params.require(:book).permit(:title, :body) 
  end
end
