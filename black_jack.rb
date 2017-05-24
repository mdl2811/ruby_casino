require 'pry'

require_relative "Card"
require_relative "Deck"
require_relative "player"

class BlackJackHand
  attr_accessor :hand, :hand_value

  def initialize(player)
      @hand = []
      @dealer_hand = []
      @hand_value = 0
      @dealer_value = 0
      @d = []
      @d = Deck.new
      @d.shuffle!
      @players = player
      @players.wallet.amount
    	puts "#{player.name}, you have a balance of #{player.wallet.amount}"
    	puts 'How much do you want to bet?'
  	  amount = gets.strip.to_i
      puts "A new deck has been shuffled and there are #{@d.remaining} cards"
      deal
      end

  def deal
    2.times do
      card = @d.draw
      @hand << card
    end

    @hand.each do |card|
      @hand_value += card.value.to_i
    end

    2.times do
      card = @d.draw
      @dealer_hand << card
    end

    @dealer_hand.each do |card|
      @dealer_value += card.value.to_i
    end
    playing
  end

  def playing
    @hand
    puts "Player's hand:"
    puts @hand
    puts @hand_value
    if @hand_value == 21
      puts "Player wins with BlackJack!"
      puts "Dealer's hand:"
      puts @dealer_hand
      player.wallet.add_money(bet * bank)
    else
      until @hand_value > 21
        puts "Do you want to hit(h) or stay(s)?"
        action = $stdin.gets.chomp
        if action == "h"
          puts "You chose to hit, here's your new hand"
          player_hit
          puts @hand
          puts @hand_value
        else
          puts "You chose to stay, here's your final hand"
          puts @hand
          break
        end
      end

      @dealer_hand
      puts "Dealer's hand:"
      puts @dealer_hand
      puts @dealer_value

      while @dealer_value < 17
        dealer_hit
        puts @dealer_hand
        puts @dealer_value
      end

      if @hand_value <= 21
        if @hand_value > @dealer_value
          puts "Player wins"
          player.wallet.add_money(bet * bank)
        elsif @hand_value == @dealer_value
          puts "Dealer and Player tied"
        elsif @dealer_value > 21
          puts "Dealer busts, Player Wins!"
          player.wallet.add_money(bet * bank)
        else
          puts "Dealer wins"
          player.wallet.remove_money(bet * bank.abs)
        end
      else
        puts "Player busts. Dealer wins"
        player.wallet.remove_money(bet * bank.abs)
      end
    end
    puts "There are #{@d.remaining} cards in the deck"
  end

  def player_hit
    @hand_value = 0
    card = @d.draw
    @hand << card
    @hand.each do |card|
      @hand_value += card.value.to_i
  end
end

  def dealer_hit
    @dealer_value = 0
    card = @d.draw
    @dealer_hand << card
    @dealer_hand.each do |card|
      @dealer_value += card.value.to_i
  end
end

  def to_s
    puts "#{@hand.to_s}, total value #{@hand_value}"
  end
end

def continue_quit(player)
  puts "Would you like to continue?
  1) yes
  2) no"
  continue = gets.strip.to_i
case continue
when 1
  puts 'Continue'

when 2
  puts 'Bye, come play again.'
end
end
