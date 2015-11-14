require "rails_helper"

RSpec.describe List do
  describe ".newest_first" do
    it "orders by the most recenlty created first" do
      newest = create(:list, created_at: 1.minute.ago)
      oldest = create(:list, created_at: 1.day.ago)
      middle = create(:list, created_at: 1.hour.ago)

      result = List.newest_first

      expect(result.map(&:id)).to eq([newest.id, middle.id, oldest.id])
    end
  end

  describe "#highlights" do
    it "orders by the most recently added" do
      list = create(:list)
      newest = create(:list_entry, list: list, created_at: 1.minute.ago)
      oldest = create(:list_entry, list: list, created_at: 1.day.ago)
      middle = create(:list_entry, list: list, created_at: 1.hour.ago)

      result = list.highlights(maximum: 3).map(&:id)

      expect(result).to eq([newest.book.id, middle.book.id, oldest.book.id])
    end

    it "limits the result to the maximum requested" do
      books = create_list(:book, 3)
      list = create_list_with_books(*books)

      result = list.highlights(maximum: 2).map(&:id)

      expect(result.size).to eq(2)
    end

    def create_list_with_books(*books)
      create(:list).tap do |list|
        books.each do |book|
          create(:list_entry, list: list, book: book)
        end
      end
    end
  end

  it "sets a slug when saved" do
    record = create(:list, name: "Foo Bar")

    result = record.slug

    expect(result).to eq("foo-bar")
  end
end
