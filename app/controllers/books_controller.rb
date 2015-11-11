class BooksController < ApplicationController
  def index
    render locals: {
      books: Book.sort_by(params[:sort]).page(params[:page]),
      filter: Filter.new
    }
  end

  def show
    book = Book.find(params[:id])
    render locals: { book: book }
  end
end
