class BooksController < ApplicationController



  def create
    @book = Book.new(params[:book].permit(:title, :body))
    @books = Book.all
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully created."
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
    flash[:notice] = "Book was successfully destroyed."

  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
     flash[:notice] = "Book was successfully editted."

    else
      render :edit
    end
  end



  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
