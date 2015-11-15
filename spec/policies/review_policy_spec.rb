require_relative "../../app/policies/review_policy"

RSpec.describe ReviewPolicy, "#authorized_for_review?" do
  it "returns true if the user has not written a review for the book yet" do
    reviewer_to_auth = instance_double("Reviewer", present?: true)
    reviewers = []

    review_authorization = ReviewPolicy.new(
      reviewers: reviewers,
      reviewer_to_auth: reviewer_to_auth
    ).authorized_for_review?

    expect(review_authorization).to eq true
  end

  it "returns false if the user has written a review for the book already" do
    reviewer_to_auth = instance_double("Reviewer", present?: true)
    reviewers = [reviewer_to_auth]

    review_authorization = ReviewPolicy.new(
      reviewers: reviewers,
      reviewer_to_auth: reviewer_to_auth
    ).authorized_for_review?

    expect(review_authorization).to eq false
  end

  it "returns false if the user is not signed in" do
    reviewer_to_auth = instance_double("Reviewer", present?: false)
    reviewers = [reviewer_to_auth]

    review_authorization = ReviewPolicy.new(
      reviewers: reviewers,
      reviewer_to_auth: reviewer_to_auth
    ).authorized_for_review?

    expect(review_authorization).to eq false
  end
end
