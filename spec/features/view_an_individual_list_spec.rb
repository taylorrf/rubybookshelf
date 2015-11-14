require "rails_helper"

RSpec.feature "View an individual list", type: :feature do
  scenario do
    list = create(:list, name: "Best Fantasy")
    add_book_to_list(title: "The Fellowship of the Ring", list: list)
    add_book_to_list(title: "The Two Towers", list: list)

    visit lists_path
    click_link("Best Fantasy")

    expect(page).to have_heading("Best Fantasy")
    expect(page).to have_book("The Fellowship of the Ring")
    expect(page).to have_book("The Two Towers")
  end

  def have_heading(title)
    have_css("h1", text: title)
  end

  def have_book(title)
    have_css(".book h1", text: title)
  end

  def add_book_to_list(title:, list:)
    book = create(:book, title: title)
    create(:list_entry, book: book, list: list)
  end
end
