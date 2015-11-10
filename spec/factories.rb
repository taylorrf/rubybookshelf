FactoryGirl.define do
  factory :author do
    name "Uncle Bob"
  end

  factory :book do
    sequence(:title) { |n| "Default Book Title #{n}" }

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
