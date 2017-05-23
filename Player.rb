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

		# set initial values
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
					puts "\n\nPlease choose one of the following."
					@gender = nil
			end
		end


		@wallet = Wallet.new

	end

end
