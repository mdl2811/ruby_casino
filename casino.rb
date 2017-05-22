#all gems here
require 'pry'
require 'colorize'

require_relative 'Player' # these are Ruby filenames
require_relative 'heads_tails'
require_relative 'indian_poker'


class Casino
  def initialize 
    puts 'Welcome to our Ruby Casino!!!!'
    @player = Player.new
    # need a casino menu using a method
    casino_menu
 
  end

 	def casino_menu
   		# put menu here
   		# csino options
   		# game options
   		# bankroll - player status
   		# quit
   		puts 'Enter the number of the game you want to play:'
   		puts '1) Indian Poker'
   		puts '2) Heads or Tails'
   		puts '3) Roulette'
   		puts '4) Craps'
   		puts '5) Black Jack'
   		puts '6) Quit'
   		game = gets.to_i
   		case game
   		when 1
   			Indian_Poker.new(@player)
   		when 2
   			#Heads_Tails.new(@player) 
   		when 3
   			#Roulette.new(@player)
   		when 4
   			#Craps.new(@player)
   		when 5
   			#Black_Jack.new(@player)
   		when 6
   			exit
   		else
   			puts "INVALID NUMBER. Try again.\n\n"
   		end

   		# and call it again!
   		casino_menu

 
	end

end

Casino.new
