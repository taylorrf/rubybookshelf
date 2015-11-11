require "rails_helper"

RSpec.feature "List all books", type: :feature do
  scenario "when there are some books to list" do
    create(:book, title: "The Fellowship of the Ring")
    create(:book, title: "The Two Towers")

    visit books_path

    expect(page).to have_book("The Fellowship of the Ring")
    expect(page).to have_book("The Two Towers")
  end

  def have_book(title)
    have_css(".book", text: title)
  end
end
