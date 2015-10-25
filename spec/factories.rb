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
end
