class List < ActiveRecord::Base
  has_many :list_entries
  has_many :books, through: :list_entries

  delegate :empty?, to: :books

  def self.newest_first
    order(created_at: :desc)
  end

  def highlights(maximum:)
    books.order("list_entries.created_at DESC").limit(maximum)
  end
end
