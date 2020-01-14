class RemoveflightTimeFromflights < ActiveRecord::Migration[5.2]
  def change
  	remove_column :flights, :flight_time, :time
  end
end
