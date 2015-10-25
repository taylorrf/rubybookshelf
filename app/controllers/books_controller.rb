class BooksController < ApplicationController
  def index
    render locals: { books: Book.all }
  end

  def show
    book = Book.find(params[:id])
    render locals: { book: book }
  end
end
