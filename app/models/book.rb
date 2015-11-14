class Book < ActiveRecord::Base
  belongs_to :genre
  belongs_to :author

  def has_summary?
    summary.present?
  end

  def sample_cover
    (cover || "default_cover.jpg")
  end
end
