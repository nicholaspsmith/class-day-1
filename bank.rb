class BankAccount

	require 'money'

	# all money will be dealt with in cents using integers

	attr_reader :f_name, :l_name, :balance, :debt

	def initialize f_name, l_name, balance
		@debt = 0;
		@f_name = f_name;
		@l_name = l_name;
		@balance = balance;
	end

	def print
		puts "#{@f_name} #{@l_name}"
		puts "Balance: $#{money_fmt(@balance)}"
		puts "Amount owed: $#{money_fmt(@debt)}"
	end

	def money_fmt amount
		dollars = amount*100
		Money.new(dollars, "USD")
	end

	def deposit amt
		@balance += amt
	end

	def withdraw amt
		if @balance >= amt
			@balance -= amt
		else
			puts "Insufficient funds"
			@debt += 10
		end
	end

	def usecredit amt
		@debt += amt
	end

	def paycredit amt
		if amt >= @balance
			@debt -= amt
			@balance -= amt
		else
			puts "Insufficient funds"
		end
	end

	#never let balance go below 0, if requested, prevent transaction
	#charge add 10 to usecredit

	def add_monthly_interest
		@debt *= 1.015
		@balance *= 1.0003
	end
end