class FavoritesController < ApplicationController
  def create
  	favorite = current_user.favorites.build(flight_id: params[:flight_id])
  	favorite.save
  	redirect_to flights_path
  end

  def destroy
  	favorite = Favorite.find_by(flight_id: params[:flight_id], user_id: current_user.id)
  	favorite.destroy
  	redirect_to flights_path
   end
end
