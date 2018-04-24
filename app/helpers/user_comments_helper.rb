module UserCommentsHelper

  def formatted_created_time(comment)
    comment.created_at.strftime("%Y-%m-%d %H:%M")
  end
end
