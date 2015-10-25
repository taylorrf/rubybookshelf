class Book < ActiveRecord::Base
  def has_summary?
    summary.present?
  end
end
