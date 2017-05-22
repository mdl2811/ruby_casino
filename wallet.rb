# all gems here
require 'pry'
require 'colorize'

class Wallet
	attr_accessor :money

	def initialize
		
		@money = money

		# set inital values
		puts 'How much money is in your wallet?'
		@money = gets.strip.to_f
		
	end
end