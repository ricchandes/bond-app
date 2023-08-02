class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)
    
    return unless @room.save

    redirect_to new_room_message_path(@room.id)
  end

  private

  def room_params
    params.require(:room).permit(:user1_id, :user2_id)
  end
end
