class UsersController < ApplicationController
  def show
  @user = User.find(params[:id])
  @room_user = RoomUser.new
  end

  def edit
  end
  
  def index
  @users = User.all
  end
end
