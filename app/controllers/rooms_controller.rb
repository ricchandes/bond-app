class RoomsController < ApplicationController
  def create
    room = Room.new
    room.create(room_params)
    redirect_to root_path
  end


  private
  def room_params
    params.require(:room).permit(user_ids: [])
  end

end