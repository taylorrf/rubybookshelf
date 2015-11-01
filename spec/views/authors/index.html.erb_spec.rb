require "rails_helper"

RSpec.describe "authors/index" do
  context "when there are authors to list" do
    it "lists the authors" do
      authors = [
        build_stubbed(:author, name: "Martin Fowler"),
        build_stubbed(:author, name: "Uncle Bob")
      ]

      render template: "authors/index", locals: { authors: authors }

      within("ul.authors") do
        expect(rendered).to have_css("li", text: "Martin Fowler")
        expect(rendered).to have_css("li", text: "Uncle Bob")
      end
    end
  end

  context "when there are no authors to list" do
    it "displays an appropriate notice" do
      render template: "authors/index", locals: { authors: [] }

      expect(rendered).to have_text(t("authors.index.no_authors_found"))
    end
  end
end
