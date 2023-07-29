class RoomMessage
  include ActiveModel::Model
  attr_accessor :user_id, :text, :room_id
  with_options presence: true do
    validates :user_id
    validates :room_id
    validates :text
    end

  def save
    room = Room.create(id:, user_ids: [])
    message.create(text:,  room_id: room.id, user_id: current_user.id)
  end
end
