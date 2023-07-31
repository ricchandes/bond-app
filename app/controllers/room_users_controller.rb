class RoomUsersController < ApplicationController

def new
  @room_message = RoomMessage.new
end

  def create
    @room_message = RoomMessage.new(room_params)
    if @room_message.valid?
      @room_message.save
      redirect_to  user_room_users_messages(params[:room_user_id])
    else
      render :new, status: :unprocessable_entity
    end
  end




  private
  def room_params
    params.require(:room_message).permit(:text, :user1_id, :user2_id)
  end
end
