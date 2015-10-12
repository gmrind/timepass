class UsersController < ApplicationController
	
	def index
	  @users = User.all
	end

	def show
	  @user = current_user
	end

	def new
	  @user = User.new
	end

end
