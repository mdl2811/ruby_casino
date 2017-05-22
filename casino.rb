#all gems here
require 'pry'
require 'colorize'

require_relative 'Player'

class Casino
  def initialize :Player
    puts 'Welcome to our Ruby Casino!!!!'
    @player = Player.new
    binding.pry
  end
end

Casino.new
