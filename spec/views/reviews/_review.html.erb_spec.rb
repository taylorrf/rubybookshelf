require "rails_helper"

RSpec.describe "books/_review" do
  it "displays the review body" do
    review = build_stubbed(:review, rating: 4, body: "Great book")
    allow(review).to receive(:reviewer_email)

    render template: "reviews/_review", locals: { review: review }

    expect(rendered).to have_text("Great book")
  end

  context "with a rating" do
    it "displays the rating" do
      review = build_stubbed(:review, rating: 4)
      allow(review).to receive(:reviewer_email)

      render template: "reviews/_review", locals: { review: review }

      expect(rendered).to have_rating(4)
    end
  end

  context "without a rating" do
    it "displays the rating" do
      review = build_stubbed(:review, rating: nil)
      allow(review).to receive(:reviewer_email)

      render template: "reviews/_review", locals: { review: review }

      expect(rendered).to have_no_rating
    end
  end

  def have_rating(rating)
    have_css(".rating", text: rating)
  end

  def have_no_rating
    have_css(".rating", count: 0)
  end
end
