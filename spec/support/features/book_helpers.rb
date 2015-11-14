module BookHelpers
  def have_book_title(title)
    have_css(".booklist h1", text: title)
  end

  def have_book_cover(cover)
    have_css("img[src*='#{cover}']")
  end

  def have_book_summary(summary)
    have_css(".booklist .summary", text: summary)
  end

  def have_displayed_books(count)
    have_css(".booklist", count: count)
  end
end
