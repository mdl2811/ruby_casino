require 'pry'

require_relative "Card"
require_relative "Deck"

class BlackJackHand
  attr_accessor :hand, :hand_value

  def initialize
      @hand = []
      @dealer_hand = []
      @hand_value = 0
      @d = []
      @d = Deck.new
      @d.shuffle!
      puts "A new deck has been shuffled and there are #{@d.remaining} cards"
      deal
  end

  def deal
    2.times do
      card = @d.draw
      @hand << card
      card.each { card + card }
    end
    2.times do
      card = @d.draw
      @dealer_hand << card
      card.each { card + card }
    end
    playing
  end

  def playing
    @hand
    puts "Player's hand:"
    puts @hand

    if @hand == 21
      puts "Player wins with BlackJack!"
      puts "Dealer's hand:"
      puts @dealer_hand
    else
binding.pry
      until @hand > 21
        puts "Do you want to hit(h) or stay(s)?"
        action = $stdin.gets.chomp
        if action == "h"
          puts "You chose to hit, here's your new hand"
          hit
          puts @hand
        else
          puts "You chose to stay, here's your final hand"
          puts @hand
          break
        end
      end

      @dealer_hand
      puts "Dealer's hand:"
      puts @dealer_hand

      while @dealer_hand < 17
        hit
        puts @dealer_hand
      end

      if @hand <= 21
        if @hand > @dealer_hand
          puts "Player wins"
        elsif @hand == @dealer_hand
          puts "Dealer and Player tied"
        else
          puts "Dealer wins"
        end
      else
        puts "Player busts. Dealer wins"
      end
    end
    puts "There are #{@d.remaining} cards in the deck"
  end

  def hit
    card = @d.draw
    @hand_value == 0 ? @hand_value = card.value.to_i : @hand_value += card.value.to_i
    @hand << card
  end

  def to_s
    puts "#{@hand.to_s}, total value #{@hand_value}"
  end
end
