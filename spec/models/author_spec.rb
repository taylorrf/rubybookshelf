require "rails_helper"

RSpec.describe Author do
  it { should validate_presence_of(:name) }
  it { should have_many(:books) }

  describe "#popular_books" do
    it "pick only 5 books" do
      author = create(:author)

      7.times do |index|
        create(:book, author: author, title: "book ##{index}")
      end

      result = author.popular_books.map(&:title)

      expect(result).to_not include("book #5", "book #6")
      expect(result).to include("book #0", "book #1",
                                "book #2", "book #3", "book #4")
    end
  end

  it "sets a slug when saved" do
    record = create(:author, name: "Foo Bar")

    result = record.slug

    expect(result).to eq("foo-bar")
  end
end
