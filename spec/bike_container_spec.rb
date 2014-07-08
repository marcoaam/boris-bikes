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

	it 'Should provide the list of available working bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)

		expect(holder.available_bikes).to eq [working_bike]
	end

	it 'Should provide the list of the broken bikes' do
		working_bike , broken_bike1 , broken_bike2 = Bike.new , Bike.new , Bike.new
		broken_bike1.break!
		broken_bike2.break!
		holder.dock(working_bike)
		holder.dock(broken_bike1)
		holder.dock(broken_bike2)

		expect(holder.broken_bikes).to eq [broken_bike1, broken_bike2]
	end

	it 'Should load a group of bikes' do
		working_bike , broken_bike1 , broken_bike2 = Bike.new , Bike.new , Bike.new
		group_of_bikes = [working_bike , broken_bike1.break!]
		holder.dock(broken_bike2.break!)
		holder.load(group_of_bikes)

		expect(holder.bikes).to eq [broken_bike2, working_bike, broken_bike1]
	end

	it 'Should release a group of bikes' do
		working_bike , broken_bike1 , broken_bike2 = Bike.new , Bike.new , Bike.new
		group_of_bikes = [working_bike , broken_bike1.break!]
		holder.dock(broken_bike2.break!)
		holder.load(group_of_bikes)
		holder.unload(group_of_bikes)

		expect(holder.bikes).to eq [broken_bike2]
	end

end