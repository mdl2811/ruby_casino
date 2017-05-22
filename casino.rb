#all gems here
require 'pry'
require 'colorize'

require_relative 'Player' # these are Ruby filenames
require_relative 'heads_tails'

class Casino
  def initialize # :Player
    puts 'Welcome to our Ruby Casino!!!!'
    @player = Player.new
    # need a casino menu using a method
    casino_menu
    # 



  end

 	def casino_menu
   		# put menu here
   		# csino options
   		# game options
   		# bankroll - player status
   		# quit
   		HeadsTails.new(@player) 
 
	end

end

Casino.new
