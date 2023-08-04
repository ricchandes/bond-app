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
   @users = User.where.not(id: current_user.id).pluck(:id)
   @user =  User.find(get_random_user(@users)) 
  end

  def get_random_user(users)
    return nil if users.empty?
    ids_number = users.length
    random_num = rand(ids_number)
    id_number  = users[random_num]
    return  id_number
  end

end
