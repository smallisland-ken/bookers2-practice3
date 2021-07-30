class UsersController < ApplicationController

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
end
