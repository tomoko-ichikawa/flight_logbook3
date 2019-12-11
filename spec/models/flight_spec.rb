require 'rails_helper'

RSpec.describe Flight, type: :model do
  it "departure_airportが空ならバリデーションが通らない" do
    flight = Flight.new(departure_airport: '', arrival_airport: '失敗テスト')
    expect(flight).not_to be_valid
  end

  it "arrival_airportが空ならバリデーションが通らない" do
    flight = Flight.new(departure_airport: '失敗しないテスト', arrival_airport: '')
    expect(flight).not_to be_valid
  end
end
