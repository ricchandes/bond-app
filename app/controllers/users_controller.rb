class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!, except: [:index, :show]



  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def log
    @user = User.find(current_user.id)
  end

  def random
   @users = User.where.not(id: current_user.id).pluck(:id)
   @user =  User.find(get_random_user(@users)) 
  end



  private
  def get_random_user(users)
    return nil if users.empty?
    ids_number = users.length
    random_num = rand(ids_number)
    id_number  = users[random_num]
    return  id_number
  end

end
