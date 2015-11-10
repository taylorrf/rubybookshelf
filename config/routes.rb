Rails.application.routes.draw do
  root "pages#home"

  resources :books, only: [:index, :show] do
    collection do
      resource :filter, only: :show, as: :book_filter, controller: "books/filter"
    end
  end

  resources :lists, only: :index

  resources :authors, only: [:index]
end
