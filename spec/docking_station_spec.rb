require 'docking_station'
require 'bike'

describe DockingStation do

	let(:station) { DockingStation.new(capacity: 20) }
	let(:bike) { Bike.new }

	it 'should accept a bike' do
		expect(station.bike_count).to eq 0

		station.dock(bike)

		expect(station.bike_count).to eq(1)
	end

	it 'Should release a bike' do
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq(0)
	end

	it 'Should know when it is full' do
		expect(station.full?).to be false
		(station.capacity).times {station.dock(Bike.new)}
		expect(station.full?).to be true
	end
end