class FriendshipsController < ApplicationController
 def create
      @friendship = current_user.friendships.build(:friend_id => params[:friend_id], approved: "false")
      if @friendship.save
        flash[:notice] = "Friend request has been sent."
        redirect_to users_show_path
      else
        flash[:error] = "Unable to request friendship."
        redirect_to users_show_path
      end
    end

    # PATCH/PUT /friendships/1
    # PATCH/PUT /friendships/1.json
    def update
    @friendship = Friendship.where(friend_id: current_user, user_id: params[:id]).first
    @friendship.update(approved: true)
      if @friendship.save
        redirect_to users_show_path, :notice => "Friend request accepted."
      else
        redirect_to users_show_path, :notice => "Sorry! Could not confirm friend!"
      end
    end

    # DELETE /friendships/1
    # DELETE /friendships/1.json
    def destroy
      @friendship = Friendship.where(friend_id: [current_user, params[:id]]).where(user_id: [current_user, params[:id]]).last
      @friendship.destroy
      flash[:notice] = "Removed friendship."
      redirect_to users_show_path
    end
end
