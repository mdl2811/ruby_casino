# all gems here
require 'pry'
require 'colorize'

require_relative 'wallet'

class Player
	attr_accessor :name, :age, :gender, :wallet

	def initialize
		# ned to think about how to implement the wallet
		# this could (should) be a class
		# or just an attribute on the user
		@name = name
		@age = age
		@gender = gender
		@wallet = wallet

		# set inital values
		puts 'What is your name?'
		@name = gets.strip
		puts "What is your age, #{@name}?"
		@age = gets.strip.to_i
		puts "What is your gender, #{@name}?"
		@gender = gets.strip
		puts  'How much money are you playing with?'
		@wallet = Wallet.new(gets.to_f)

	end
end
