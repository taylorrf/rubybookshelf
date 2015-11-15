require "rails_helper"

RSpec.describe "lists/index" do
  context "when there are lists" do
    it "displays the lists" do
      lists = [build_stubbed(:list)]

      render template: "lists/index", locals: { lists: lists }

      expect(rendered).to have_css("ul.lists h2")
    end
  end

  context "when there are no lists to display" do
    it "displays an appropriate notice" do
      render template: "lists/index", locals: { lists: [] }

      expect(rendered).to have_text(t(".index.no_lists_yet"))
    end
  end
end
