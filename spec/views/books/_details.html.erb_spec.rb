require "rails_helper"

RSpec.describe "books/_details" do
  context "when the book has a summary" do
    it "displays the summary" do
      book = build_stubbed(:book, summary: "The first book in the series")

      render template: "books/_details", locals: { book: book }

      expect(rendered).to have_css("p.summary",
                                   text: "The first book in the series")
    end
  end

  context "when the book has no summary" do
    it "doesn't display a summary" do
      book = build_stubbed(:book)

      render template: "books/_details", locals: { book: book }

      expect(rendered).to_not have_css("p.summary")
    end
  end

  context "when the book has a cover sample" do
    it "displays the cover sample" do
      book = build_stubbed(:book, cover: "book_cover.jpg")

      render template: "books/_details", locals: { book: book }

      expect(rendered).to have_cover("book_cover.jpg")
    end
  end

  context "when the book has no a cover sample" do
    it "doesn't display the cover sample" do
      book = build_stubbed(:book)

      render template: "books/_details", locals: { book: book }

      expect(rendered).to have_cover("default_cover.jpg")
    end
  end

  context "when the book has an author" do
    it "displays author name" do
      author = build_stubbed(:author, name: "John")
      book = build_stubbed(:book, author: author)

      render template: "books/_details", locals: { book: book }

      expect(rendered).to have_css("h3", "John")
    end
  end

  context "when the book has no an author" do
    it "doesn't display author name" do
      book = build_stubbed(:book)

      render template: "books/_details", locals: { book: book }

      expect(rendered).to_not have_css("h3", "John")
    end
  end

  it "displays the release date" do
    release_date = Date.new(2015, 4, 13)
    book = build_stubbed(:book, released_on: release_date)

    render template: "books/show", locals: { book: book }

    expect(rendered).to have_css(".released-on", text: "April 13, 2015")
  end

  def have_cover(image)
    have_css("img[src*='#{image}']")
  end
end
