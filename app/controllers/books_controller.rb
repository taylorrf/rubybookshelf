class BooksController < ApplicationController
  def index
    render locals: { books: Book.all, filter: Filter.new }
  end

  def show
    book = Book.find(params[:id])
    render locals: { book: book }
  end
end
