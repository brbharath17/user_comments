class UserCommentsController < ApplicationController
  def new
    @comment = UserComment.new
  end

  def create
    UserComment.create(permit_params["comment"], request.remote_ip)
    @comments = UserComment.filtered_comments
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.js 
    end
  end

  def permit_params
    params.require(:user_comment).permit(:comment)
  end
end
