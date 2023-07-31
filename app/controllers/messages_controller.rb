class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @room_user = RoomUser.find(params[:user_id])
    @message = Message.create(message_params)
    if @message.save
      redirect_to user_room_users_messages_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @messages = Message.includes(:user)
    
  end

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, room_user_id: @room_user.id)
  end
  
end
