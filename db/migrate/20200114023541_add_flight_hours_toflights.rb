class AddFlightHoursToflights < ActiveRecord::Migration[5.2]
  def change
  	add_column :flights, :flight_hours, :integer
  end
end
