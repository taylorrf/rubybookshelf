require "rails_helper"

RSpec.feature "Pagination", type: :feature do
  scenario "less than one page of books" do
    create_list(:book, 2)

    visit books_path

    expect(page).to have_displayed_books(2)
    expect(page).to_not have_pagination_links
  end

  scenario "viewing the first page of books" do
    create_list(:book, 22)

    visit books_path

    expect(page).to have_displayed_books(20)
  end

  scenario "paginating through the books" do
    create_list(:book, 22)

    visit books_path
    click_link "Next"

    expect(page).to have_displayed_books(2)
  end

  def have_displayed_books(count)
    have_css(".books .book", count: count)
  end

  def have_pagination_links
    have_css("nav.pagination")
  end
end
