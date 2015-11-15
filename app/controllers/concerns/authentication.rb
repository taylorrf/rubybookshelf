module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :authorize, :current_user, :signed_in?
  end

  def authorize
    redirect_to login_path unless current_user
  end

  def current_user
    @_current_user ||= User.find_by(id: session[:user_id]) || Guest.new
  end

  def signed_in?
    current_user.present?
  end
end
