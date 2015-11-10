require "rails_helper"

RSpec.describe "books/index" do
  context "when there are books to list" do
    it "lists the books" do
      books = [
        build_stubbed(:book, title: "The Fellowship of the Ring"),
        build_stubbed(:book, title: "The Two Towers")
      ]

      filter = Filter.new
      render template: "books/index", locals: {
        books: Kaminari.paginate_array(books).page,
        filter: filter
      }

      within("ul.books") do
        expect(rendered).to have_css("li", text: "The Fellowship of the Ring")
        expect(rendered).to have_css("li", text: "The Two Towers")
      end
    end
  end

  context "when there are no books to display" do
    it "displays an appropriate notice" do
      books = []

      render template: "books/index", locals: {
        books: Kaminari.paginate_array(books).page,
        filter: Filter.new
      }

      expect(rendered).to have_text(t("books.index.no_books_yet"))
    end
  end
end
