class AuthorsController < ApplicationController
  def index
    render locals: { authors: Author.all }
  end

  def show
    author = Author.find(params[:id])
    render locals: { author: author }
  end
end
