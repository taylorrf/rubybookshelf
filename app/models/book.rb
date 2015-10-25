class Book < ActiveRecord::Base
  belongs_to :genre

  def has_summary?
    summary.present?
  end
end
