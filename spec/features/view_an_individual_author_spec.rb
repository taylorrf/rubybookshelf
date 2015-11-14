require "rails_helper"

RSpec.feature "View an individual author", type: :feature do
  scenario do
    author = create(:author, name: "Sandi Metz", description: "developer")
    book = create(:book, author: author, cover: "pratical.jpg")

    visit authors_path
    click_link("Sandi Metz")

    expect(page).to have_css("h1", text: "Sandi Metz")
    expect(page).to have_css("p", text: author.description)
    expect(page).to have_book_title(book.title)
    expect(page).to have_book_cover(book.cover)
  end
end
