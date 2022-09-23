class BooksController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path(@book), notice: 'You have created book successfully.'
    else
      render :show
    end
  end

  def index
    @books = Book.all
    @book = Book.find_by(params[:id])
    # @@user = User.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id), notice: 'You have updated book successfully.'
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end


  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
