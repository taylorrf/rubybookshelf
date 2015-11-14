module BookHelpers
  def have_book_title(title)
    have_css(".book h1", text: title)
  end

  def have_book_cover(cover)
    have_css("img[src*='#{cover}']")
  end

  def have_book_summary(summary)
    have_css(".book .summary", text: summary)
  end

  def have_displayed_books(count)
    have_css(".book", count: count)
  end
end
