class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"
	validates_presence_of :user_id, :friend_id

	# Return true if the users are (possibly pending) friends.
  	def self.exists?(user, friend)
    	not find_by_user_id_and_friend_id(user, friend).nil?
  	end

	# Record a pending friend request.
 	def self.request(user, friend)
    	unless user == friend or Friendship.exists?(user, friend)
      		transaction do
			  create(:user => user, :friend => friend, :status => 'pending')
			  create(:user => friend, :friend => user, :status => 'requested')
      		end
    	end
  	end
end
