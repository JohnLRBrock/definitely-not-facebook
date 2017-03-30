module PostsHelper
  def feed_posts
    # get the id of the user and all their friends
    ids = [current_user.id]
    ids << current_user.friend_ids
    ids = ids.flatten
    Post.where(user_id: ids).order(created_at: :desc)
  end
end
