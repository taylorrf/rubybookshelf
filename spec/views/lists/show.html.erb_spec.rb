require "rails_helper"

RSpec.describe "lists/show" do
  context "when the list is empty" do
    it "shows an appropriate message" do
      list = build_stubbed(:list)

      render template: "lists/show", locals: { list: list }

      expect(rendered).to have_text(t(".show.empty"))
    end
  end

  context "when there are books to list" do
    it "lists the books" do
      list = build_stubbed(:list)
      allow(list).to receive(:empty?).and_return(false)
      allow(list).to receive(:books).and_return([
        build_stubbed(:book),
        build_stubbed(:book)
      ])

      render template: "lists/show", locals: { list: list }

      expect(rendered).to have_css(".book", count: 2)
    end
  end
end
