class RoomMessage
  include ActiveModel::Model
  attr_accessor :user1_id, :user2_id, :text, :room_user_id
  with_options presence: true do
    validates :room_user_id
    validates :text
    end

  def save
    room_user = RoomUser.create(user1_id:, user2_id:)
    message.create(text:, room_user_id: room_user.id, user_id: current_user.id)
  end
end
