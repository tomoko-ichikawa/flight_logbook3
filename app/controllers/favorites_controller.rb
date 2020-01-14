class FavoritesController < ApplicationController
  before_action :set_flight, only: [:create, :destroy]

  def create
  	@favorite = current_user.favorites.create(favorite_params)
    @flight = @favorite.flight
    @favorite.save
    flight.create_notification_favorite!(current_user)
    redirect_to flight_path(@flight)
  end

  def destroy
  	@favorite = Favorite.find_by(favorite_params, user_id: current_user.id)
    @favorite.destroy
    redirect_to flight_path(@flight)
  end
 
  private

  def set_flight
    @flight = Flight.find(params[:flight_id])
  end

  def favorite_params
    params.permit(:flight_id)
  end
end
