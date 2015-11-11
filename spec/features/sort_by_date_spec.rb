require "rails_helper"

RSpec.feature "Sort by date", type: :feature do
  scenario do
    create(:book, released_on: 1.day.ago, title: "The Fellowship of the Ring")
    create(:book, released_on: 1.month.ago, title: "The Return of the King")
    create(:book, released_on: 1.week.ago, title: "The Two Towers")

    visit books_path
    click_link "Sort by Date Added"

    expect(book_list).to eq([
      "The Fellowship of the Ring",
      "The Two Towers",
      "The Return of the King"
    ])
  end

  def book_list
    page.all(".book").map(&:text)
  end
end
