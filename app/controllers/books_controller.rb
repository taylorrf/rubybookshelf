class BooksController < ApplicationController
  def index
    render locals: {
      books: Book.sort_by(params[:sort]).page(params[:page]),
      filter: Filter.new
    }
  end

  def show
    render locals: {
      book: book,
      review_policy: ReviewPolicy.new(
        reviewers: book_reviewers,
        reviewer_to_auth: current_user)
    }
  end

  private

  def book
    @_book ||= Book.find params[:id]
  end

  def book_reviewers
    book.reviews.map(&:reviewer)
  end
end
