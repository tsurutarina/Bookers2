class UsersController < ApplicationController
  def show
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
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
