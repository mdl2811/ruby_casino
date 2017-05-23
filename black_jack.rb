require 'pry'

require_relative "Card"
require_relative "Deck"

class BlackJackHand
  attr_accessor :hand, :hand_value

  def initialize
      @hand = []
      @dealer_hand = []
      @hand_value = 0
      @dealer_value = 0
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
      end

      if @hand_value <= 21
        if @hand_value > @dealer_value
          puts "Player wins"
        elsif @hand_value == @dealer_value
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
