FactoryBot.define do
  factory :flight do
    airline { 'Factoryで作ったデフォルトの航空会社' }
    flight_number { 'Factoryで作ったデフォルトの便名' }
    aircraft_type { 'Factoryで作ったデフォルトの機種' }
    seat_class { 'Factoryで作ったデフォルトの座席クラス' }
    seat_number { 'Factoryで作ったデフォルトの座席番号' }
    departure_airport { 'Factoryで作ったデフォルトの出発空港' }
    arrival_airport { 'Factoryで作ったデフォルトの到着空港' }
    flight_time { '10:00' }
    flight_mile { '4000' }
    fare { '2000000' }
    booking_class { 'Aクラス' }
    getting_mile { '4000' }
    getting_point { '4000' }
    review { 'Factoryで作ったデフォルトの感想' }
    actual_departure_time { '11:00' }
    actual_arrival_time { '14:00' }
    user_id { 1 }
  end

  factory :second_flight, class: Flight do
    airline { 'Factoryで作ったデフォルトの航空会社2' }
    flight_number { 'Factoryで作ったデフォルトの便名2' }
    aircraft_type { 'Factoryで作ったデフォルトの機種2' }
    seat_class { 'Factoryで作ったデフォルトの座席クラス2' }
    seat_number { 'Factoryで作ったデフォルトの座席番号2' }
    departure_airport { 'Factoryで作ったデフォルトの出発空港2' }
    arrival_airport { 'Factoryで作ったデフォルトの到着空港2' }
    flight_time { '11:00' }
    flight_mile { '5000' }
    fare { '3000000' }
    booking_class { 'Bクラス' }
    getting_mile { '5000' }
    getting_point { '5000' }
    review { 'Factoryで作ったデフォルトの感想2' }
    actual_departure_time { '12:00' }
    actual_arrival_time { '16:00' }
    user_id { 2 }
  end

  factory :third_flight, class: Flight do
    airline { 'Factoryで作ったデフォルトの航空会社3' }
    flight_number { 'Factoryで作ったデフォルトの便名3' }
    aircraft_type { 'Factoryで作ったデフォルトの機種3' }
    seat_class { 'Factoryで作ったデフォルトの座席クラス3' }
    seat_number { 'Factoryで作ったデフォルトの座席番号3' }
    departure_airport { 'Factoryで作ったデフォルトの出発空港3' }
    arrival_airport { 'Factoryで作ったデフォルトの到着空港3' }
    flight_time { '12:30' }
    flight_mile { '6000' }
    fare { '3000000' }
    booking_class { 'C' }
    getting_mile { '6000' }
    getting_point { '6000' }
    review { 'Factoryで作ったデフォルトの感想3' }
    actual_departure_time { '17:00' }
    actual_arrival_time { '19:00' }
    user_id { 3 }
  end
end