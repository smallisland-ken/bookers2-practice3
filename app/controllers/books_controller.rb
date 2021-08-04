class BooksController < ApplicationController
    before_action :authenticate_user!


  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @bookuser = @book.user
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
    flash[:notice] = "You have created a new book!"
    redirect_to book_path(@book_new)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
      
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated successfully!"
    redirect_to book_path(@book)
    else
      render:edit
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
