require "rails_helper"

RSpec.describe "books/show" do
  context "when the book has a summary" do
    it "displays the summary" do
      book = build_stubbed(:book, summary: "The first book in the series")

      render template: "books/show", locals: { book: book }

      expect(rendered).to have_css(".summary",
                                   text: "The first book in the series")
    end
  end

  context "when the book has no summary" do
    it "does not display a summary" do
      book = build_stubbed(:book)

      render template: "books/show", locals: { book: book }

      expect(rendered).to_not have_css(".summary")
    end
  end
end
