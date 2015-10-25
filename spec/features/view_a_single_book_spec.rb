require "rails_helper"

RSpec.feature "View a single book", type: :feature do
  scenario do
    create(:book,
           title: "The Fellowship of the Ring",
           summary: "The first book in the series")

    visit books_path
    click_link("The Fellowship of the Ring")

    expect(page).to have_heading("The Fellowship of the Ring")
    expect(page).to have_summary("The first book in the series")
  end

  def have_heading(title)
    have_css("h1", text: title)
  end

  def have_summary(summary)
    have_css(".summary", text: summary)
  end
end
