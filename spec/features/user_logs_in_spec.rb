require "rails_helper"

RSpec.describe "User logs in" do
  scenario "with known credentials" do
    user = create :user

    visit root_path
    login_as user

    expect(page).to have_content t("session.success", email: user.email)
  end
end
