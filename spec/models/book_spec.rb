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
end
