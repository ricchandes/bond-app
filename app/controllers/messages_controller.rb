class MessagesController < ApplicationController
  include MessagesHelper
  
  def new
    @room = Room.find(params[:room_id])
    @user = User.find(for_who(@room))
    @message = Message.new
    @messages = @room.messages.includes(:room)
  end

  def create
    @room = Room.find(params[:room_id])
    @type = have_relationship?(@room)
    @message = Message.new(message_params)
    if @message.save

     name = whose_message?(@message)
     MessageChannel.broadcast_to @room,  {message: @message, name: name, type: @type}
    else
      @user = User.find(for_who(@room))
      @messages = @room.messages.includes(:room)

      render :new, status: :unprocessable_entity
    end
  end

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, room_id: @room.id , type: @type)
  end
end
