require "rails_helper"

RSpec.feature "Filter Books by Genre", type: :feature do
  # TODO: what about filter by "No Genre"?
  scenario do
    create(:book, title: "The Fellowship of the Ring", genre: fantasy)
    create(:book, title: "Programming Ruby", genre: programming)

    visit books_path
    apply_filter "Science Fiction"

    expect(book_list).to include("The Fellowship of the Ring")
    expect(book_list).to_not include("Programming Ruby")
  end

  def apply_filter(genre)
    select(genre, from: "Genre")
    click_on "Filter"
  end

  def book_list
    page.all("ul.books li").map(&:text)
  end

  def fantasy
    @fantasy ||= create(:genre, name: "Science Fiction")
  end

  def programming
    @programming ||= create(:genre, name: "Programming")
  end
end
