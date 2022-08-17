module BookmarksHelper
  def boormark_or_unbookmark(review)
    if Bookmark.find_by(user: @current_user, review: review)
      "Unbookmark"
    else
      "Bookmark"
    end
  end

  def bookmark_http_method(review)
    if Bookmark.find_by(user: @current_user, review: review)
      :delete
    else
      :post
    end
  end
end
