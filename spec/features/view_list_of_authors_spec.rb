require "rails_helper"

RSpec.feature "View list of Authors", type: :feature do
  scenario "with some authors" do
    create(:author, name: "Martin Fowler")
    uncle = create(:author, name: "Uncle Bob")

    create(:book, author: uncle, cover: "clean_code.jpg")
    create(:book, author: uncle, cover: "clean_coders.jpg")

    visit authors_path

    expect(page).to have_author("Martin Fowler")
    expect(page).to have_author("Uncle Bob")
    expect(page).to have_book_cover("clean_code.jpg")
    expect(page).to have_book_cover("clean_coders.jpg")
  end

  scenario "without authors" do
    visit authors_path
    expect(page).to have_content(t("authors.index.no_authors_found"))
  end

  def have_author(name)
    have_css(".authors-index h2", text: name)
  end
end
