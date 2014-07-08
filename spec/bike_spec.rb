require 'bike'

describe Bike do

	let(:bike) { Bike.new }

	it 'Should not be broken after we create it' do
		expect(bike.broken?).not_to be true
	end

	it 'should be able to break' do
		expect(bike.break!.broken?).to be true
	end

	it 'Should be able to be fixed' do
		expect(bike.break!.fix!.broken?).to be false
	end

end