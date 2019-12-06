class AddactualDepartureTimeToflights < ActiveRecord::Migration[5.2]
  def change
  	add_column :flights, :actual_departure_time, :datetime
  end
end
