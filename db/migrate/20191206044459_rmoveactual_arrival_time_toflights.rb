class RmoveactualArrivalTimeToflights < ActiveRecord::Migration[5.2]
  def change
  	remove_column :flights, :actual_arrival_time, :time
  end
end
