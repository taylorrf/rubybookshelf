class Filter
  include ActiveModel::Model

  attr_accessor :genre_id

  def matches
    Book.where(genre_id: genre_id)
  end

  def genres
    Genre.containing_books
  end
end
