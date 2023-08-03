class UsersController < ApplicationController
  include UsersHelper


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def random
    @users = User.all
    @user = User.find(get_random_user(@users))
  end

end
