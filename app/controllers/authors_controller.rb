class AuthorsController < ApplicationController
  def index
    render locals: { authors: Author.all }
  end
end
