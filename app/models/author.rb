class Author < ActiveRecord::Base
  validates :name, presence: true
  has_many :books

  def popular_books( limit=5 )
    books.limit(limit)
  end
end
