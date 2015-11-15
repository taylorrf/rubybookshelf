class BookFacade
  def initialize(book:, current_user:)
    @book = book
    @current_user = current_user
  end

  attr_reader :book

  def review_policy
    ReviewPolicy.new(
      reviewers: book_reviewers,
      reviewer_to_auth: current_user
    )
  end

  def new_review
    Review.new
  end

  private

  attr_reader :current_user

  def book_reviewers
    book.reviews.map(&:reviewer)
  end
end
