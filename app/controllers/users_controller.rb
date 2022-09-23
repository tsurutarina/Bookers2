class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def index
    @user = User.find(params[:id])
    # @user.id = current_user.id
    @users = User.all
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
