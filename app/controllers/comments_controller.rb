class CommentsController < ApplicationController
  def create
    current_user.comments.create(comment_params)
    redirect_to root_url
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end
