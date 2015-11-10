module Books
  class FilterController < ApplicationController
    def show
      filter = Filter.new(params[:filter])
      render "books/index", locals: {
        books: filter.matches.page(params[:page]),
        filter: filter
      }
    end
  end
end
