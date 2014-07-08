require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def fix(group_of_bikes)
		group_of_bikes.each { |bike| bike.fix! }
	end

end