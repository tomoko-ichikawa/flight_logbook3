class AddPostStatusToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :status, :integer, default: 0
  end
end
