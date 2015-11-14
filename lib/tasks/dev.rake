if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      jrr = create(:author, name: "J. R. R. Tolkien", description: "J.R.R. Tolkien (1892.1973), beloved throughout the world as the creator of The Hobbit and The Lord of the Rings, was a professor of Anglo-Saxon at Oxford, a fellow of Pembroke College, and a fellow of Merton College until his retirement in 1959.")
      dave = create(:author, name: "Dave Thomas", description: "Dave Thomas (@pragdave) is a cornerstone of the Ruby community, and is personally responsible for many of its innovative directions and initiatives. Dave is a programmer, and now he is an accidental publisher.")

      fantasy = create(:genre, name: "Fantasy")
      programming = create(:genre, name: "Programming")
      create(:genre, name: "Science")

      fellowship = create(:book, title: "The Fellowship of the Ring", genre: fantasy, author: jrr, cover: "http://ecx.images-amazon.com/images/I/51wIJN44zhL.jpg",
             summary: "The dark, fearsome Ringwraiths are searching for a Hobbit. Frodo Baggins knows that they are seeking him and the Ring he bears—the Ring of Power that will enable evil Sauron to destroy all that is good in Middle-earth. Now it is up to Frodo and his faithful servant, Sam, with a small band of companions, to carry the Ring to the one place it can be destroyed: Mount Doom, in the very center of Sauron’s realm.")
      two_towers = create(:book, title: "The Two Towers", genre: fantasy, author: jrr, cover: "http://ecx.images-amazon.com/images/I/51HUqZm3JTL.jpg", summary: "The Fellowship is scattered. Some are bracing hopelessly for war against the ancient evil of Sauron. Some are contending with the treachery of the wizard Saruman. Only Frodo and Sam are left to take the accursed One Ring, ruler of all the Rings of Power, to be destroyed in Mordor, the dark realm where Sauron is supreme. Their guide is Gollum, deceitful and lust-filled, slave to the corruption of the Ring.")
      create(:book, title: "Programming Ruby", genre: programming, author: dave, cover: "http://ecx.images-amazon.com/images/I/41gtODXuRlL.jpg", summary: "Ruby, a new, object-oriented scripting language, has won over thousands of Perl and Python programmers in Japan -- and it's now launching worldwide. This is the world's first English-language developer's guide to Ruby. Written by the two leading Ruby developers, Programming Ruby demonstrates Ruby's compelling advantages, and serves as a start-to-finish tutorial and reference for every developer.")
      create(:book, title: "Oxford English Dictionary")


      create(:list, name: "Empty List")
      best_fantasy = create(:list, name: "Best Fantasy")

      create(:list_entry, book: fellowship, list: best_fantasy)
      create(:list_entry, book: two_towers, list: best_fantasy)

      # for testing pagination
      create_list(:book, 25, genre: fantasy, summary: "Alright, when you into a movie theatre in Amsterdam, you can buy beer. And I don't mean in a paper cup either. They give you a glass of beer. And in Paris, you can buy beer at MacDonald's. And you know what they call a Quarter Pounder with Cheese in Paris? They don't call it a Quarter Pounder with Cheese? No, they got the metric system there, they wouldn't know what the fuck a Quarter Pounder is. What'd they call it? They call it Royale with Cheese.")
    end
  end
end
