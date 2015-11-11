module BooksHelper
  # can't figure why `url_for` works but `path_for` doesn't
  def sort_path(criteria = nil)
    url_for(
      controller: params[:controller],
      action: params[:action],
      sort: criteria,
      filter: params[:filter],
      page: params[:page]
    )
  end
end
