class RoomsController < ApplicationController
  def create
    @room_message = RoomMessage.new(room_params)
    if @room_message.valid?
      @room_message.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

  end


  private
  def room_params
    params.require(:room_message).permit(:text, user_ids: [])
  end
end