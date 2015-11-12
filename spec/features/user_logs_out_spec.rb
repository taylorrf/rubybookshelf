require "rails_helper"

RSpec.feature "User logs out" do
  scenario "to end his session on the website" do
    user = create :user

    login_as user
    click_link t("shared.header.logout")

    expect(page).to have_link t("shared.header.login"), href: login_path
  end
end
