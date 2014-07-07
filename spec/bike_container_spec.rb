require 'bike_container'
require 'bike'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	let(:holder) { ContainerHolder.new }
	let(:bike) { Bike.new }

	it 'should accept a bike' do
		expect(holder.bike_count).to eq 0

		holder.dock(bike)

		expect(holder.bike_count).to eq(1)
	end

	it 'Should release a bike' do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it 'Should know when it is full' do
		expect(holder.full?).to be false
		(holder.capacity).times { holder.dock(Bike.new) }
		expect(holder.full?).to be true
	end

	it 'Should not accept a bike if it is full' do
		(holder.capacity).times { holder.dock(Bike.new) }
		expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
	end

	it 'Should provide the list of available bikes for rental' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq [working_bike]
	end

end