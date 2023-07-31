class RoomUsersController < ApplicationController

def new
  @room_user = RoomUser.new
end

  def create
    @room_user = RoomUser.create(room_params)
    if  @room_user.save
      redirect_to  user_room_users_messages_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def room_params
    params.require(:room_user).permit( :user1_id, :user2_id)
  end
end
