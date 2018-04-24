class UserComment < ApplicationRecord
  def self.create(comment, ip)
    user_comment = UserComment.new
    user_comment.comment = comment
    user_comment.ip = ip
    user_comment.save
  end

end
