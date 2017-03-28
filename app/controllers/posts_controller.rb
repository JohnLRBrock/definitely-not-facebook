class PostsController < ApplicationController
  # displays all the posts made by you and your friends
  def index
    @user = current_user
    @friends = @user.friends
    @posts = feed_posts(@user)
  end

  private
    def feed_posts(user)
    end
end
