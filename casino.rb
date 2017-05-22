#all gems here
require 'pry'
require 'colorize'

require_relative 'Player'

class Casino
  def initialize
    puts 'Welcome to our Ruby Casino!!!!'
    @player = Player.new
  end
end

Casino.new
