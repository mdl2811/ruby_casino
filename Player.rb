# all gems here
require 'pry'
require 'colorize'

require_relative 'wallet'

require_relative 'methods'

class Player
	attr_accessor :name, :age, :gender, :wallet

	def initialize
		puts "name"
		@name = gets.strip
		# @name = get_string('name', @name)
		puts "age"
		@age = gets.strip.to_i
		@gender = gender
		@wallet = wallet

		# set inital values
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


		@wallet = Wallet.new

	end

	def get_string(type, var)
		while (var == nil) || (var == '') do
			puts "What is your #{type}?"
			var = gets.strip
			if var == ''
				puts "You must enter a valid #{type}."

			end
		end
		var
	end

	def get_num(type, var)
		while (var == nil) || (var == 0) do
			puts "What is your #{type}?"
			var = gets.strip.to_i
			if var == 0
				puts "You must enter a valid #{type}."
			end
		end
		var
	end
end
