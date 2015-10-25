Rails.application.routes.draw do
  root "books#index"

  resources :books, only: [:index, :show] do
    collection do
      resource :filter, only: :show, as: :book_filter, controller: "books/filter"
    end
  end
end
