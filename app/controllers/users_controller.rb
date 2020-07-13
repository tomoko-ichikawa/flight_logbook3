class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:show, :edit, :update]

	def index
		@q = User.ransack(params[:q])
		@users = @q.result(distinct: true)
	end

	def show
		if logged_in?(:admin) || current_user == @user
			@q = @user.flights.ransack(params[:q])
			@flights = @q.result.order(created_at: :desc)
		else
			@q = @user.flights.ransack(params[:q])
			flights = @q.result.order(created_at: :desc)
			@flights = flights.published
		end

		@favorite_flights = @user.favorite_flights
		@total_getting_miles = @flights.all.sum(:getting_mile)
		@total_getting_points = @flights.all.sum(:getting_point)
	end

	def edit
	end

	def update
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

	def set_user
		@user = User.find(params[:id])
	end
end
