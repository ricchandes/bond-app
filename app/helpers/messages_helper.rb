module MessagesHelper
  def whose_message?(message)
    user = User.find(message.user_id)
    user.name
  end
end
