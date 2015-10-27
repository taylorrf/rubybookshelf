require "rails_helper"

RSpec.describe Genre do
  describe "#containing_books" do
    it "returns genres which have books" do
      fantasy_genre = create(:genre, name: "Fantasy")
      create(:book, genre: fantasy_genre)

      result = Genre.containing_books.map(&:name)

      expect(result).to eq(%w(Fantasy))
    end

    it "excludes genres with no books" do
      create(:genre, name: "Fantasy")

      result = Genre.containing_books

      expect(result).to be_empty
    end

    it "lists each genre only once" do
      fantasy_genre = create(:genre, name: "Fantasy")
      create_pair(:book, genre: fantasy_genre)

      result = Genre.containing_books.map(&:name)

      expect(result).to eq(%w(Fantasy))
    end
  end
end
