class BooksController < ApplicationController
  def index
    render locals: { books: Book.all }
  end
end
