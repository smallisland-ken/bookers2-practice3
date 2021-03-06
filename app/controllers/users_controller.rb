class UsersController < ApplicationController
    before_action :authenticate_user!


  def show
    @user = User.find(params[:id])
    @book = Book.new
    @bookuser = @user.books
  end

  def index
    @user = User.find(current_user.id)
    @book = User.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(users_params)
    redirect_to users_path
  end

  private
  def users_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end