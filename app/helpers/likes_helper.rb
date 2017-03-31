module LikesHelper
  def number_of_likes(post)
    pluralize(post.likes.count, 'like')
  end
  def liked?(post)
    post.likes.exists?(user_id: current_user.id)
  end
end
