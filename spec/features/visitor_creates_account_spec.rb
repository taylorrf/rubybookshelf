require "rails_helper"

RSpec.feature "Visitor registers account" do
  scenario "to become a member of the site" do
    visit root_path

    click_link t("shared.header.registration")
    fill_in t("registration.email"), with: "example_user@example.com"
    fill_in t("registration.password"), with: "examplepassword"
    click_button t("registration.register")

    expect(page).to have_content(
      t("registration.success", email: "example_user@example.com")
    )
  end
end
