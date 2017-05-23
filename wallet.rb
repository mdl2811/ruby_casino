# all gems here
require 'pry'
require 'colorize'

require_relative "methods"

class Wallet
	attr_accessor :amount

	def initialize
		while (@amount == nil) or (@amount <= 0) do
			puts "How much money do you have?"
			@amount = gets.to_f
			if (@amount == 0) || (@amount == nil)
				puts "Enter a valid amount of money."
			end
		end
	end


	def add_money(amt)
		@amount = @amount + amt

	end

	def remove_money(amt)
		@amount = @amount - amt
	end

	def query_money
		puts "You have #{@amount} in your wallet."
	end
end
