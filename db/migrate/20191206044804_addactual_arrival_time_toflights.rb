class AddactualArrivalTimeToflights < ActiveRecord::Migration[5.2]
  def change
  	add_column :flights, :actual_arrival_time, :datetime
  end
end
