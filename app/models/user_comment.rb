class UserComment < ApplicationRecord
  def self.create(comment, ip)
    user_comment = UserComment.new
    user_comment.comment = comment
    user_comment.ip = ip
    user_comment.save
  end

  def self.filtered_comments
    sql = "SELECT rank_filter.* FROM (
              select ip, comment, created_at, 
                RANK () OVER (
                    PARTITION BY ip, date_part('minute',created_at)::int / 1 
                    order by created_at desc
                ) 
              from user_comments order by created_at desc
            ) 
          rank_filter WHERE RANK = 1"

    comments = ActiveRecord::Base.connection.execute(sql)
    comments =  comments.values.collect do |value|
                  UserComment.new({ip: value[0], comment: value[1], created_at: value[2]})
                end
    comments
  end

  def self.top_comments
    comments = self.all.order('created_at desc')
    return comments if comments.empty?
    time = comments.first.created_at - 300
    filtered_comments = [comments.first]
    comments.each do |comment|
      if comment.created_at < time 
        time = comment.created_at - 300
        filtered_comments << comment        
      end

      filtered_comments << comment  if comment.created_at <= time
    end
    filtered_comments    
  end

end
