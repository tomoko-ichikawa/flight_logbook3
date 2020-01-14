class AddFlightMinutesToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :flight_minutes, :integer
  end
end
