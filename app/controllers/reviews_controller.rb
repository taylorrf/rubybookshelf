class ReviewsController < ApplicationController
  before_action :authorize

  def create
    review = Review.new review_params
    review.save
    redirect_to book_path(book),
                notice: t("reviews.create.notice")
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
end
