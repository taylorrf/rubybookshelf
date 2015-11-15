require "rails_helper"

RSpec.describe "lists/_list" do
  context "when the list is empty" do
    it "shows an appropriate message" do
      list = build_stubbed(:list)

      render template: "lists/_list", locals: { list: list }

      expect(rendered).to have_css("p", text: t(".list.empty"))
    end
  end

  context "when there are books to list" do
    it "lists the books" do
      list = build_stubbed(:list)
      allow(list).to receive(:empty?).and_return(false)
      allow(list).to receive(:highlights).and_return([
        build_stubbed(:book),
        build_stubbed(:book)
      ])

      render template: "lists/_list", locals: { list: list }

      expect(rendered).to have_css("ul.books li")
    end
  end
end
