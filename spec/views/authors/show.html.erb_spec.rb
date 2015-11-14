require "rails_helper"

RSpec.describe "authors/show" do
  context "when the author has books" do
    it "displays their books" do
      author = build_stubbed(:author, name: "Aaron")
      book = build_stubbed(:book, author: author, title: "Legendary Ruby")
      allow(author).to receive(:books).and_return([book])

      render template: "authors/show", locals: { author: author }

      expect(rendered).to have_css("a", text: "Legendary Ruby")
    end
  end

  context "when the author hasn't books" do
    it "only displays their basic info" do
      author = build_stubbed(:author, name: "Aaron", description: "Tender")

      render template: "authors/show", locals: { author: author }

      expect(rendered).to have_css("h1", text: "Aaron")
      expect(rendered).to have_css("p", text: "Tender")
    end
  end
end
