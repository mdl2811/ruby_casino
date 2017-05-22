# all gems here
require 'pry'
require 'colorize'

class Wallet
	attr_accessor :amount

	def initialize(amount)
		
		@amount = amount
		
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