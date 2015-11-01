require "rails_helper"

RSpec.feature "View list of Authors", type: :feature do
  scenario "with some authors" do
    create(:author, name: "Martin Fowler")
    create(:author, name: "Uncle Bob")

    visit authors_path

    expect(page).to have_author("Martin Fowler")
    expect(page).to have_author("Uncle Bob")
  end

  scenario "without authors" do
    visit authors_path
    expect(page).to have_content(t("authors.index.no_authors_found"))
  end

  def have_author(name)
    have_css("ul.authors", text: name)
  end
end
