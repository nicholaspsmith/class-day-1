#
# Nicholas Smith
# This program is designed to simulate a racetrack
# with individual racecars (object)
# 

class Racecar
	attr_accessor :speed, :name

	def initialize name
		@name = name
		@speed = rand(0..60)
	end

	def increase_speed amt# mph
		@speed += amt
	end

end

class Racetrack

	attr_reader :time

	def initialize
		@time = 0
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
		if (!@race_start and name != "start")
			@cars.push(Racecar.new(name))
		end
	end

	def start
		@race_start = true
		@cars.each do |x|
			##give each car a random speed between (60..80)
			x.speed= rand(60..80)
		end

		begin
			puts "---------------\nLap #{@time+1}\n---------------"
			forward
			place_bets
		end while (@time < 5)

		@cars.each do |x|
			x.speed = 0
		end

		print_winner
		print_payout
	end

	def forward# @time by one hour
		@cars.each do |car|
			car.increase_speed rand(21)# number between 0..20
		end
		@time += 1
	end

	def check car# for speed
		return car.speed
	end

	def print_winner
		winner = @cars[0]
		##print winner of the race
		@cars.each do |car|
			if car.speed > winner.speed
				winner = car
			end
		end
	puts "The winner is #{winner.name}"
	end

	def place_bets
		puts "Enter bet amount and press enter"
		amt = gets.chomp
		puts "Place bet of $#{amt} on which car?"
		@cars.each do |car|
			puts car.name
		end
		ans = gets.chomp
		@cars.each do |car|
			if car.name == ans
				puts "Bet #{amt} on #{car.name}"
			end
		end
		
	end

	def print_payout
		puts "print_payout to be implemented..."
	end
end