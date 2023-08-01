class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    like = current_user.like_relationships.new(liked_id: params[:user_id])
    like.save
    redirect_to root_path
  end

  def destroy
    like = current_user.like_relationships.find_by(liked_id: params[:user_id])
    like.destroy
    redirect_to root_path
  end
end
