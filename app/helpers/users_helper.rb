module UsersHelper
 def like_you(user)
  @likes = user.liked_relationships.where(liked_id: user.id).pluck(:like_id)
  @users = []
 @likes.each do |like|
 user = User.find(like)
 user_name = user.name
 @users << user_name
 end
 return @users

 
 end
end
