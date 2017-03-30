module FriendshipsHelper
  def friends?(user, friend)
    user.friends.exists?(friend.id)
  end
end
