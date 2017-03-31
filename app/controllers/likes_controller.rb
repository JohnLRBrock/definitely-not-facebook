class LikesController < ApplicationController
  def create
    like = Post.find(params[:like][:post_id]).likes.create(user_id: current_user.id)
    redirect_to root_url
  end

  def destroy
    likes = Like.where(user_id: current_user, post_id: params[:id])
    current_user.likes.delete(likes)
    redirect_to root_url
  end

  private
  def like_params
    params.require(:like).permit(:id, :post_id)
  end
end
