module MessagesHelper
  def whose_message?(message)
    user = User.find(message.user_id)
    user.name
  end

  def have_relationship?(room)
    user1 = User.find(room.user1_id)
    status1 = user1.status.id
    user2 = User.find(room.user2_id)
    status2 = user2.status.id
    if status1 == 2 && status2 == 2
      return MessageA
    else
      return MessageB
    end
  end

  def for_who(room)
    person = room.user1_id
    if person == current_user.id
      return room.user2_id
    else
      return person
    end
  end
end
