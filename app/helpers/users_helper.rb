module UsersHelper
 def like_you(user)
  @likes = user.liked_relationships.where(liked_id: user.id).pluck(:like_id)
  @users = []
 @likes.each do |like|
 user = User.find(like)
 @users << user
 end
 return @users
 end

 def message_you(user)
  rooms = Room.where(user1_id: user).or(Room.where(user2_id: user)).pluck(:id)
  all_messages = []
  rooms.each do |room| 
    messages = Message.where(room_id: room).where.not(user_id: current_user.id)
    all_messages.concat(messages)
    end
    return all_messages
end
end
