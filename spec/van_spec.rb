require 'van'
require 'bike'

describe Van do

	let(:van) { Van.new(capacity: 5) }
	let(:bike) { Bike.new }

	it 'should allow setting default capacity on initialising' do
		expect(van.capacity).to eq 5
	end
	
end