
class Car

	require 'money'

	attr_reader :distance, :fuel

	def initialize
		@distance = 0
		@fuel = 10.0
		puts "the initialize method is running automatically"
	end

	def get_info
		"I have driven #{@distance} miles. I have #{@fuel} gallons of gas left."
	end


	def drive miles
		mpg = 20.0
		fuel_needed = miles/mpg
		

		if fuel_needed <= @fuel
			@distance += miles
			@fuel -= fuel_needed
			range = @fuel * mpg
			puts "You can travel #{range} more miles"
		else
			puts "Can't go that far"
			range = @fuel * mpg
			puts "You have enough fuel for #{range} miles"
		end
	end

	def fill
		gas_filled = 10.0 - @fuel;
		gas_price = 350;

		dollars = Money.new((gas_filled*gas_price), "USD")

		puts "Gallons: #{gas_filled.round(3)}"
		puts "Total: $#{dollars}"
	end

end