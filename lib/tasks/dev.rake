if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      fantasy = create(:genre, name: "Fantasy")
      programming = create(:genre, name: "Programming")
      create(:genre, name: "Science")

      create(:book, title: "The Fellowship of the Ring", genre: fantasy,
             summary: "The first book in the series")
      create(:book, title: "The Two Towers", genre: fantasy)
      create(:book, title: "Programming Ruby", genre: programming)
      create(:book, title: "Oxford English Dictionary")
    end
  end
end
