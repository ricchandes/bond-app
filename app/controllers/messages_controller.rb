class MessagesController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
    @message = Message.new
    @messages = @room.messages.includes(:room)

  end

  def create
    @room = Room.find(params[:room_id])
    @message = Message.create(message_params)
    if @message.save
      redirect_to new_room_message_path(@room)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, room_id: @room.id)
  end
  
end
