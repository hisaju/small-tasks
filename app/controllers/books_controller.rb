class BooksController < ApplicationController

  # CRUD
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  def index
    # Get all books
    @books = Book.all
  end

  # GET /books/1
  def show; end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    # Create new book
    @book = Book.new(book_params)

    # Save book
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end

  end

  def update
    # Update book
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # Destroy book
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
  def set_book
    # Get book by id
    @book = Book.find(params[:id])
  end

  def book_params
    # Get book params
    params.require(:book).permit(:title, :author, :description, :isbn)
  end

end
