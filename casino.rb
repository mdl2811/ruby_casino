#all gems here
require 'pry'
require 'colorize'
require 'sounder'

require_relative 'player' # these are Ruby filenames
require_relative 'heads_tails'
require_relative 'single_card_poker'
require_relative "Card"
require_relative "Deck"
require_relative "black_jack"
require_relative "methods"
require_relative "print_slots"


class Casino
  def initialize
    print_welcome
    puts "\nWelcome to our Ruby Casino!!!!"

    @player = Player.new

    Sounder::System.set_volume 50 # 0-100

    # need a casino menu using a method
    casino_menu

  end

 	def casino_menu
   		# put menu here
   		# csino options
   		# game options
   		# bankroll - player status
   		# quit
      print_slots
      sound = Sounder::Sound.new "./69687__lukaso__casino.wav"
      sound.play

   		puts 'Enter the number of the game you want to play:'
   		puts '1) Single Card No-See-Em Poker -- WORKING!!'
   		puts '2) Heads or Tails -- WORKING!!'
#   		puts '3) Roulette--not yet working'
#   		puts '4) Craps--not yet working'
   		puts '3) Black Jack--not yet working'
   		puts '4) Quit'
   		game = gets.to_i
   		case game
   		when 1
   			 SingleCardPoker.new(@player)
   		when 2
   		   HeadsTails.new(@player)
#   		when 3
   			#Roulette.new(@player)
#   		when 4
   			#Craps.new(@player)
   		when 3
   			BlackJackHand.new(@player)
   		when 4
   			exit
   		else
   			puts "INVALID NUMBER. Try again.\n\n"
   		end

   		# and call it again!
   		casino_menu


	end

end

Casino.new
