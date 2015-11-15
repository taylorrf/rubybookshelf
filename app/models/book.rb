class Book < ActiveRecord::Base
  CannotCalculateAverageRatingError = Class.new(RuntimeError)

  extend FriendlyId
  friendly_id :title, use: :slugged

  SORT_CRITERIA_RELEASE_DATE = "release_date"

  belongs_to :genre
  belongs_to :author
  has_many :reviews

  def has_summary?
    summary.present?
  end

  def has_release_date?
    released_on.present?
  end

  def sample_cover
    (cover || "default_cover.jpg")
  end

  def self.sort_by(criteria)
    if criteria == SORT_CRITERIA_RELEASE_DATE
      newest_first
    else
      alphabetically
    end
  end

  def self.newest_first
    order(released_on: :desc)
  end

  def self.alphabetically
    order("lower(title)")
  end

  # TODO: extract this so as to minimize behaviour within the AR model
  def average_rating
    if reviews.any?
      reviews.with_ratings.average(:rating)
    else
      fail CannotCalculateAverageRatingError
    end
  end

  def has_average_rating?
    reviews.with_ratings.any?
  end
end
