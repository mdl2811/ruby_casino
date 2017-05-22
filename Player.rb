# all gems here
require 'pry'
require 'colorize'

require_relative 'wallet'

require_relative 'methods'

class Player
	attr_accessor :name, :age, :gender, :wallet

	def initialize
		@name = name
		@age = age
		@gender = gender
		@wallet = wallet

		# set inital values
		@name = get_string('name', @name)
		@age = get_num('age', @age)

		until @gender do
			puts "Enter the letter for your gender:"
			puts "(M)ale"
			puts "(F)emale"
			puts "(N)o answer"
			@gender = gets.strip.downcase
			case @gender
				when 'm', 'male'
					@gender = 'male'
				when 'f', 'female'
					@gender = 'female'
				when 'n', 'no answer'
					@gender = 'no answer'
				else
					puts "Please choose one of the following."
					@gender = nil
			end
		end

		@wallet = Wallet.new(0)
		while (@wallet.amount == nil) or (@wallet.amount <= 0) do
			puts  'How much money are you playing with?'
			@wallet.amount = gets.to_f
			if (@wallet.amount == 0) || (@wallet.amount == nil)
				puts "Enter a valid amount of money."
			end
		end
	end

end
