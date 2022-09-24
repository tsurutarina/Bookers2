class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to  user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'You have updated book successfully.'
    else
      @user = User.find(params[:id])
      render :edit
    end
  end

  def index
    @user = current_user
    # @user.id = current_user.id
    @users = User.all
    @book = Book.new
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
