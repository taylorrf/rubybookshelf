Rails.application.routes.draw do
  root "pages#home"

  resources :books, only: [:index, :show] do
    collection do
      resource :filter, only: :show, as: :book_filter, controller: "books/filter"
    end
    resources :reviews, only: [:create]
  end

  resources :lists, only: [:index, :show]
  resources :authors, only: [:index, :show]
  resource :registration, only: [:new, :create]
  resource :session, only: [:create, :destroy]

  get "/login", to: "sessions#new", as: :login
end
