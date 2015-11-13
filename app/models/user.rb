class User < ActiveRecord::Base
  has_secure_password

  validates :email, email: true, uniqueness: true

  def self.lookup_for_authentication_with(identifier:)
    find_by(email: identifier) || Guest.new
  end
end
