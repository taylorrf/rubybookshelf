module ApplicationHelper
  def logged_out?
    !current_user.present?
  end
end
