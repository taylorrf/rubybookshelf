module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :signed_in?
  end

  def current_user
    @_current_user ||= User.find_by(id: session[:user_id]) || Guest.new
  end

  def signed_in?
    current_user.present?
  end
end
