class ReviewsController < ApplicationController
  before_action :authorize

  def create
    review = Review.new review_params

    if review.save
      redirect_to book_path(book), notice: t("reviews.create.notice")
    else
      render template: "books/show", locals: { facade: book_facade }
    end
  end

  private

  def review_params
    params.
      require(:review).
      permit(:body, :rating).
      merge(reviewer: current_user, book: book)
  end

  def book
    @_book ||= Book.find params[:book_id]
  end

  def book_facade
    BookFacade.new(book: book, current_user: current_user)
  end
end
