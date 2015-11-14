require "rails_helper"

RSpec.feature "List all books", type: :feature do
  scenario "when there are some books to list" do
    create(:book, title: "The Fellowship of the Ring")
    create(:book, title: "The Two Towers")

    visit books_path

    expect(page).to have_book_title("The Fellowship of the Ring")
    expect(page).to have_book_title("The Two Towers")
  end
end
