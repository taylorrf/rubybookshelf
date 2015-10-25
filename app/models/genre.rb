class Genre < ActiveRecord::Base
  has_many :books

  # TODO: sort alphabetically?

  def self.containing_books
    joins(:books).distinct
  end
end
