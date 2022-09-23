class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user), notice: 'You have updated user successfully.'
  end

  def index
    @user = User.find_by(params[:id])
    # @user.id = current_user.id
    @users = User.all
    @book = Book.new
  end

  # def create
    # @book = Book.new
    # @book.user_id = current_user.id
    # if @book.save
      # redirect_to books_path(@book)
    # else
      # render :show
    # end
  # end



  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
