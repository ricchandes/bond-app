class UsersController < ApplicationController
  def show
  @user = User.find(params[:id])
  Room.new
  end

  def edit
  end
  
  def index
  @users = User.all
  end
end
