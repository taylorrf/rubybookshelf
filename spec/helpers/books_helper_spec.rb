require "rails_helper"

RSpec.describe BooksHelper, type: :helper do
  describe "#sort_path" do
    it "returns the standard books_paths when there's on args" do
      stub_params

      result = helper.sort_path

      expect(result).to eq(books_path)
    end

    it "retains the current sort order" do
      stub_params

      result = helper.sort_path(Book::SORT_CRITERIA_ADDED)

      expect(result).to eq(books_path(sort: Book::SORT_CRITERIA_ADDED))
    end

    it "retains the current page number" do
      stub_params(page: "page-number")

      result = helper.sort_path

      expect(result).to eq(books_path(page: "page-number"))
    end

    it "retains the current filter" do
      stub_params(filter: "fantasy")

      result = helper.sort_path

      expect(result).to eq(books_path(filter: "fantasy"))
    end

    def stub_params(args = {})
      allow(helper).to receive(:params).and_return(
        {
          controller: "books",
          action: "index"
        }.merge(args)
      )
    end
  end
end
