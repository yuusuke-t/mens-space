class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :baria_user, only: [:edit, :update]

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.id = current_user.id
		if @user.update(user_params)
    		redirect_to user_path(@user)
    	else
    		render :edit
    	end
	end

	private

	def user_params
		params.require(:user).permit(:name, :profile_image)
	end

	def baria_user
		unless params[:id].to_i == current_user.id
  			redirect_to user_path(current_user)
  		end
   end


end
