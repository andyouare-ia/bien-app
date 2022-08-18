module BookmarksHelper
  def boormark_or_unbookmark(review)
    if Bookmark.find_by(user: @current_user, review: review)
      image_tag "bookmark-black.svg", style: "height:25px;width:auto;"
    else
      image_tag "bookmark-white.svg", style: "height:25px;width:auto;"
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
