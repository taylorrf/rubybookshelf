require "rails_helper"

RSpec.describe "authors/index" do
  context "when there are authors to list" do
    it "lists the authors" do
      martin_fowler = build_stubbed(:author, name: "Martin Fowler")
      uncle_bob = build_stubbed(:author, name: "Uncle Bob")

      render template: "authors/index",
             locals: { authors: [martin_fowler, uncle_bob] }

      expect(rendered).to have_css("h2", text: "Martin Fowler")
      expect(rendered).to have_css("h2", text: "Uncle Bob")
    end

    it "lists the popular books by each author" do
      uncle_bob = build_stubbed(:author, name: "Uncle Bob")
      clean_code = build_stubbed(:book,
                                 cover: "http://amz.on/clean_code.jpg")
      clean_coders = build_stubbed(:book,
                                   cover: "http://amz.on/clean_coders.jpg")
      allow(uncle_bob).to receive(:popular_books).
        and_return([clean_code, clean_coders])

      render template: "authors/index", locals: { authors: [uncle_bob] }

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
