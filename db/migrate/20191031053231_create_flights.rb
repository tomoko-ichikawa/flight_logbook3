class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
    	t.integer :user_id
        t.date :departure_date
        t.string :airline
        t.string :flight_number
        t.string :aircraft_type
        t.string :seat_class
        t.string :seat_number
        t.string :departure_airport
        t.time :departure_estimated_time
        t.time :actual_departure_time
        t.string :arrival_airport
        t.time :arrival_estimated_time
        t.time :actual_arrival_time
        t.time :flight_time
        t.integer :flight_mile
        t.integer :fare
        t.string :booking_class
        t.integer :getting_mile
        t.integer :getting_point
        t.text :review
        t.text :photo1
        t.text :photo2
        t.text :photo3
        t. integer :total_getting_mile
        t.integer :total_getting_point

      t.timestamps
    end
  end
end
