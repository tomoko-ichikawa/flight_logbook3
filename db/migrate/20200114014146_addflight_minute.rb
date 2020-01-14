class AddflightMinute < ActiveRecord::Migration[5.2]
  def change
  	add_column :flights, :flight_minute, :integer
  end
end
