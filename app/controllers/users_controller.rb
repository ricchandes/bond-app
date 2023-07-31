class UsersController < ApplicationController
  def show
  @user = User.find(params[:id])
  @room = Room.new
  end

  def edit
  end
  
  def index
  @users = User.all
  end
end
