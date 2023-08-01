class MessagesController < ApplicationController
  include MessagesHelper
  
  def new
    @room = Room.find(params[:room_id])
    @message = Message.new
    @messages = @room.messages.includes(:room)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast "message_channel", {message: @message, user: whose_message?(@message)} #追加
    else
      render :new, status: :unprocessable_entity
    end
  end

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, room_id: @room.id)
  end
end
