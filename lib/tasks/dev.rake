if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      fantasy = create(:genre, name: "Fantasy")
      programming = create(:genre, name: "Programming")
      create(:genre, name: "Science")

      fellowship = create(:book, title: "The Fellowship of the Ring", genre: fantasy,
             summary: "The first book in the series")
      two_towers = create(:book, title: "The Two Towers", genre: fantasy)
      create(:book, title: "Programming Ruby", genre: programming)
      create(:book, title: "Oxford English Dictionary")

      create(:list, name: "Empty List")
      best_fantasy = create(:list, name: "Best Fantasy")

      create(:list_entry, book: fellowship, list: best_fantasy)
      create(:list_entry, book: two_towers, list: best_fantasy)

      # for testing pagination
      create_list(:book, 25, genre: fantasy)
    end
  end
end
