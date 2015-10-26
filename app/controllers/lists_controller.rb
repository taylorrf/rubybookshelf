class ListsController < ApplicationController
  def index
    render locals: { lists: List.newest_first }
  end
end
