class FriendshipsController < ApplicationController


  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    respond_to do |format|
      if @friendship.save
        format.html { redirect_to users_show_path, notice: 'Added friend.' }
      else
        format.html { redirect_to users_index_path, alert: 'Cannot add as a friend...!!!' }
      end
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to users_show_path, notice: 'Friend removed...' }
    end
  end

end
