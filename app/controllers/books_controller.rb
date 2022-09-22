class BooksController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path(@book)
    else
      render :show
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    # @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  end

  def destroy
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
