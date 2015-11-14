require "rails_helper"

RSpec.feature "View a single book", type: :feature do
  scenario do
    create(:book,
           title: "The Fellowship of the Ring",
           summary: "The first book in the series",
           cover: "fellowship_ring.jpg")

    visit books_path
    click_link("The Fellowship of the Ring")

    expect(page).to have_book_title("The Fellowship of the Ring")
    expect(page).to have_book_summary("The first book in the series")
    expect(page).to have_book_cover("fellowship_ring.jpg")
  end
end
