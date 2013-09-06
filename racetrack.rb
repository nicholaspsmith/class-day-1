#
# Nicholas Smith
# This program is designed to simulate a racetrack
# with individual racecars (object)
# 

class Racecar
	attr_accessor :speed, :name

	def increase_speed by_this_many# mph
		##
	end

end

class Racetrack

	attr_reader :time

	def initialize
		@cars = Array.new
		@race_start = false
		prompt_user
	end

	def prompt_user
		user_input = ""
		until user_input == "start" do
			puts "enter name of a racecar or 'start' to begin race"
			user_input = gets.chomp
			addCar(user_input)
		end
		start# race
	end

	def addCar(name)
		if (!@race_start)
			@cars.push(Racecar.new(name))
		end
	end

	def start
		@race_start = true
		@cars.each do |x|
			##give each car a random speed between (60..80)
			x.speed = rand(60..80)
			puts x.speed
		end

		begin
			##place bet
			forward
			@time += 1
		end while (time < 6)

		@cars.each do |x|
			x.speed = 0
		end

		print_winner
	end

	def forward# time by one hour
		@time += 1

		if @time < 6
			@cars.each do car
				car.increase_speed rand(21)# number between 0..20
			end
		end
	end

	def check car# for speed
		return car.speed
	end

	def print_winner
		##print winner of the race
	end
end