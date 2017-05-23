# all gems here
require 'pry'
require 'colorize'

require_relative "methods"

class Wallet
	attr_accessor :amount

	def initialize
		while (@amount == nil) || (@amount <= 0) do
			puts "How much money do you have?"
			@amount = gets.to_f
			if (@amount == 0) || (@amount == nil)
				puts "Enter a valid amount of money."
			end
		end
	end


	def add_money(amt)
		@amount = @amount + amt
        sound = Sounder::Sound.new "./262812__win88emily__card-shuffle-win88.mp3"
        sound.play

	end

	def remove_money(amt)
		@amount = @amount - amt

		while (@amount == nil) || (@amount <= 0) do
			puts "You have #{@amount} in your wallet."
			puts "How much money do you want to add to your wallet?"
			add_amt = gets.to_f
			if (add_amt <= 0) || (add_amt == nil)
				puts "Enter a valid amount of money."
			end
			@amount = @amount + add_amt
			query_money
		end

	end

	def query_money
		puts "You have #{@amount} in your wallet."
		@amount
	end
end
