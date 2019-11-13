class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@q = User.ransack(params[:q])
		@users = @q.result(distinct: true)
	end

	def show
		@user = User.find(params[:id])
		@flights = @user.flights
		@favorite_flights = @user.favorite_flights
		@getting_miles = @flights.all.sum(:getting_mile)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_show_path(@user)
		else
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon, :icon_cache)
	end
end
