require "rails_helper"

RSpec.describe "authors/index" do
  context "when there are authors to list" do
    it "lists the authors" do
      authors = [
        create(:author, name: "Martin Fowler"),
        create(:author, name: "Uncle Bob")
      ]

      create(:book, author: authors[1], cover: "http://amz.on/clean_code.jpg")
      create(:book, author: authors[1], cover: "http://amz.on/clean_coders.jpg")

      render template: "authors/index", locals: { authors: authors }

      expect(rendered).to have_css("h2", text: "Martin Fowler")
      expect(rendered).to have_css("h2", text: "Uncle Bob")
      expect(rendered).to have_css("img[src*='http://amz.on/clean_code.jpg']")
      expect(rendered).to have_css("img[src*='http://amz.on/clean_coders.jpg']")
    end
  end

  context "when there are no authors to list" do
    it "displays an appropriate notice" do
      render template: "authors/index", locals: { authors: [] }

      expect(rendered).to have_text(t("authors.index.no_authors_found"))
    end
  end
end
