class Author < ActiveRecord::Base
  validates :name, presence: true
end
