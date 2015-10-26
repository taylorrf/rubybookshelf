FactoryGirl.define do
  factory :book do
    title "Default Book Title"

    trait :no_genre do
      genre nil
    end
  end

  factory :genre do
    name "Default Genre"
  end

  factory :list do
    name "Default List Name"
  end

  factory :list_entry do
    book
    list
  end
end
