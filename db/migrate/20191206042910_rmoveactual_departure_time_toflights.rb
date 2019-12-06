class RmoveactualDepartureTimeToflights < ActiveRecord::Migration[5.2]
  def change
  	remove_column :flights, :actual_departure_time, :time
  end
end
