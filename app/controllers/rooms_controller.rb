class RoomsController < ApplicationController
  def create
    binding.pry
    Room.create(user_ids: pramas[:user_id])
  end

end
