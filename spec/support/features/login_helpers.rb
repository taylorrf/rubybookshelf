module LoginHelpers
  def login_as(user)
    visit root_path
    click_link t("application.header.login")
    fill_in t("registration.email"), with: user.email
    fill_in t("registration.password"), with: user.password
    click_button t("registration.login")
  end
end
