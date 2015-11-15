require "rails_helper"

RSpec.feature "User writes a review", type: :feature do
  scenario "if he has written no previous review for a book" do
    create(
      :book,
      title: "The Shades: a history",
      reviews: []
    )

    user = create :user

    login_as user
    within "header.header-2" do
      click_link "Books"
    end
    click_link "The Shades: a history"
    fill_in t("reviews.form.body"),
            with: "They missed the Dragon's Den. Unbelievable"
    select "4", from: "Your rating"
    click_on t("reviews.form.submit")

    expect(page).to have_content user.email
    expect(page).to have_content "They missed the Dragon's Den. Unbelievable"
    expect(page).to have_content "Rating: 4"
  end

  scenario "if he has written a review for the book already" do
    reviewer = create :user
    create(
      :book,
      title: "The Shades: a history",
      reviews: [create(:review, reviewer: reviewer)]
    )

    login_as reviewer
    click_link "Books", match: :first
    click_link "The Shades: a history"

    expect(page).not_to have_content t("reviews.form.body")
  end
end
