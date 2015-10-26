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
    fellowship = create(:book, title: "The Fellowship of the Ring")
    two_towers = create(:book, title: "The Two Towers")
    create(:list_entry, list: best_fantasy, book: fellowship)
    create(:list_entry, list: best_fantasy, book: two_towers)

    visit lists_path

    entries = list_entries("Best Fantasy")
    expect(entries).to include("The Fellowship of the Ring")
    expect(entries).to include("The Two Towers")
  end

  def list_entries(list_name)
    list = find("li", text: list_name)
    list.all("li").map(&:text)
  end

  def have_list(name)
    have_css(".lists li", text: name)
  end
end
