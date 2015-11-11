class Book < ActiveRecord::Base
  SORT_CRITERIA_ADDED = "added"

  belongs_to :genre
  belongs_to :author

  def has_summary?
    summary.present?
  end

  def sample_cover
    (cover || "default_cover.jpg")
  end

  def self.sort_by(criteria)
    if criteria == SORT_CRITERIA_ADDED
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
end
