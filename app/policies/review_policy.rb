class ReviewPolicy
  attr_reader :reviewers, :reviewer_to_auth

  def initialize(reviewers:, reviewer_to_auth:)
    @reviewers = reviewers
    @reviewer_to_auth = reviewer_to_auth
  end

  def authorized_for_review?
    reviewer_is_logged_in? && has_not_already_reviewed?
  end

  private

  def reviewer_is_logged_in?
    reviewer_to_auth.present?
  end

  def has_not_already_reviewed?
    !reviewers.include? reviewer_to_auth
  end
end
