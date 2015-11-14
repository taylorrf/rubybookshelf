require "rails_helper"

RSpec.describe Book do
  it { should belong_to(:author) }

  describe "#has_summary?" do
    it "is true if the book has a summary" do
      book = build_stubbed(:book, summary: "Summary of book")

      result = book.has_summary?

      expect(result).to be(true)
    end

    it "is false if the book has a nil summary" do
      book = build_stubbed(:book, summary: nil)

      result = book.has_summary?

      expect(result).to be(false)
    end

    it "is false if the book's summary is all whitespace" do
      book = build_stubbed(:book, summary: " \t\n")

      result = book.has_summary?

      expect(result).to be(false)
    end
  end

  describe "#sample_cover" do
    it "has a cover image" do
      book = build_stubbed(:book, cover: "book_cover.jpg")

      result = book.sample_cover

      expect(result).to eq("book_cover.jpg")
    end

    it "hasn't a cover image" do
      book = build_stubbed(:book)

      result = book.sample_cover

      expect(result).to eq("default_cover.jpg")
    end
  end

  describe "#sort_by" do
    context "when the criteria 'added'" do
      it "lists the newest-added first" do
        oldest = create(:book, released_on: 1.month.ago)
        newest = create(:book, released_on: 1.day.ago)
        middle = create(:book, released_on: 1.week.ago)

        result = Book.sort_by(Book::SORT_CRITERIA_ADDED)

        expect(result).to eq([newest, middle, oldest])
      end
    end

    context "otherwise" do
      it "lists the books alphabetically" do
        book_a = create(:book, title: "Book A")
        book_c = create(:book, title: "Book C")
        book_b = create(:book, title: "Book B")

        result = Book.sort_by("").map(&:title)

        expect(result).to eq([book_a, book_b, book_c].map(&:title))
      end

      it "is case-insensitive" do
        book_uppercase_a = create(:book, title: "Book A")
        book_uppercase_c = create(:book, title: "Book C")
        book_lowercase_b = create(:book, title: "Book b")

        result = Book.sort_by("").map(&:title)

        expect(result).to eq(
          [book_uppercase_a, book_lowercase_b, book_uppercase_c].map(&:title)
        )
      end
    end
  end

  it "sets a slug when saved" do
    record = create(:book, title: "Foo Bar")

    result = record.slug

    expect(result).to eq("foo-bar")
  end
end
