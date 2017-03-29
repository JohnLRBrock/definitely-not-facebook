class PostsController < ApplicationController
  # displays all the posts made by you and your friends
  def index
    @posts = feed_posts
    @post = current_user.posts.build
  end

  def create
    current_user.posts.create(posts_params)
    redirect_to root_path
  end


  private
    def feed_posts
      # get the id of the user and all their friends
      ids = [current_user.id]
      ids << current_user.friend_ids

      Post.where(user_id: ids).order(created_at: :desc)
    end

    def posts_params
      params.require(:post).permit(:body)
    end
end
