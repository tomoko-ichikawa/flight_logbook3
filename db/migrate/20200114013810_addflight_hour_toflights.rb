class AddflightHourToflights < ActiveRecord::Migration[5.2]
  def change
  	add_column :flights, :flight_hour, :integer
  end
end
