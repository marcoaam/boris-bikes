require 'garage'
require 'bike'

describe Garage  do

	let(:garage) { Garage.new(capacity: 50)}

	it 'Should be initialized with a capacity of 50' do
		expect(garage.capacity).to eq 50
	end

	it 'Sould be able to fix bikes that are in the container' do

		bike1, bike2, bike3, bike4 = Bike.new, Bike.new, Bike.new, Bike.new
		group_of_bikes = [ bike1.break!, bike2.break!, bike3.break!, bike4.break! ]
		garage.load(group_of_bikes)

		expect(garage.fix(group_of_bikes)).to eq [ bike1, bike2, bike3, bike4 ]
	end
end