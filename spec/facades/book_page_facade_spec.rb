require "rails_helper"

RSpec.describe BookFacade do
  describe "#book" do
    it "returns the book" do
      book = double(:book)
      user = double(:user)
      facade = BookFacade.new(book: book, current_user: user)

      result = facade.book

      expect(result).to eq(book)
    end
  end

  describe "#review_policy" do
    it "returns the appropriate policy" do
      # lots of stubbing needed here, maybe there's a better way?
      reviewer = double(:reviewer)
      review = double(:review, reviewer: reviewer)
      book = double(:book, reviews: [review])
      user = double(:user)
      policy = double(:policy)
      allow(ReviewPolicy).to receive(:new).with(
        reviewers: [reviewer],
        reviewer_to_auth: user
      ).and_return(policy)
      facade = BookFacade.new(book: book, current_user: user)

      result = facade.review_policy

      expect(result).to eq(policy)
    end
  end
end
