class BooksController < ApplicationController
  def index
    render locals: {
      books: Book.sort_by(params[:sort]).page(params[:page]),
      filter: Filter.new
    }
  end

  def show
    facade = BookFacade.new(book: book, current_user: current_user)
    render locals: { facade: facade }
  end

  private

  def book
    @_book ||= Book.find params[:id]
  end
end
