require "rails_helper"

RSpec.describe Filter do
  describe "#genres" do
    it "delegates to `Genre`" do
      filter = Filter.new
      genres = double(:genres)
      allow(Genre).to receive(:containing_books).and_return(genres)

      result = filter.genres

      expect(result).to eq(genres)
    end
  end

  describe "#matches" do
    it "returns only books in that genre" do
      _book_without_genre = create(:book, :no_genre)
      fantasy_book = create(:book, genre: fantasy_genre)
      _programming_book = create(:book, genre: programming_genre)

      result = Filter.new(genre_id: fantasy_genre.id).matches

      expect(result).to eq([fantasy_book])
    end
  end

  def fantasy_genre
    @fantasy_genre ||= create(:genre, name: "Fantasy")
  end

  def programming_genre
    @programming_genre ||= create(:genre, name: "Programming")
  end
end
