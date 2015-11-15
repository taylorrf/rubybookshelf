require "rails_helper"

RSpec.describe "Shows all of the lists of books", type: :feature do
  scenario "list of lists" do
    create(:list, name: "Best Fantasy")
    create(:list, name: "Best Science Fiction")

    visit lists_path

    expect(page).to have_list("Best Fantasy")
    expect(page).to have_list("Best Science Fiction")
  end

  scenario "books within a list" do
    best_fantasy = create(:list, name: "Best Fantasy")
    fellowship = create(:book, cover: "http://cov.er/fellowship_ring.jpg")
    two_towers = create(:book, cover: "http://cov.er/two_towers.jpg")
    create(:list_entry, list: best_fantasy, book: fellowship)
    create(:list_entry, list: best_fantasy, book: two_towers)

    visit lists_path

    expect(page).to have_list("Best Fantasy")
    expect(page).to have_book_cover("http://cov.er/fellowship_ring.jpg")
    expect(page).to have_book_cover("http://cov.er/two_towers.jpg")
  end

  def have_list(name)
    have_css(".lists-index h2", text: name)
  end
end
