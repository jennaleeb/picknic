class FriendshipsController < ApplicationController
  def create
  	@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
  	if @friendship.save
  		flash[:notice] = "Successfully created friendship"
  		redirect_to friends_path
  	else
  		flash[:error] = "Unable to create friendship"
  		redirect_to friends_path
  	end
  end

  def destroy
  	@friendship = current_user.friendships.find(params[:id])
  	@friendship.destroy
  	flash[:notice] = "Successfully destroyed friendship"
  	redirect_to friends_path
  end
end
