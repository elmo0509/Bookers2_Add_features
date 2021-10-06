class RelationshipsController < ApplicationController
  def create
    follower = current_user.relationships.build(follower_id: params[:user_id])
    follower.save
    redirect_to request.referrer
  end
  
  def destroy
    follower = current_user.relationships.find_by(follower_id: params[:user_id])
    follower.destroy
    redirect_to request.referrer
  end
end
