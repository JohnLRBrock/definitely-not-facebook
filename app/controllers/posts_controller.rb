class PostsController < ApplicationController
  # displays all the posts made by you and your friends
  def index
    @post = current_user.posts.build
  end

  def create
    current_user.posts.create(posts_params)
    redirect_to root_path
  end


  private
    def posts_params
      params.require(:post).permit(:body)
    end
end
