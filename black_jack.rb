require 'pry'

class Player
  attr_accessor :hand, :hand_value, :ace_count
  def initialize
      @hand = []
      @hand_value = 0
      @ace_count = ace_count
      2.times do
        card = $d.draw
        @hand_value == 0 ? @hand_value = card.value.to_i : @hand_value += card.value.to_i
        @hand << card
      end
  end

  def hit
    card = $d.draw
    @hand_value == 0 ? @hand_value = card.value.to_i : @hand_value += card.value.to_i
    @hand << card
  end

  def switch_ace
    while @hand_value > 21 && @ace_count > 0
      @ace_count -= 1
      @hand_value -= 10
    end
  end

  def to_s
    puts "#{@hand.to_s}, total value #{@hand_value}"
  end
end

$d = Deck.new
$d.shuffle!
puts "A new deck has been shuffled and there are #{$d.remaining} cards"

play = Player.new
puts "Player's hand:"
puts play.to_s
deal = Player.new

if play.hand_value == 21
  puts "Player wins with BlackJack!"
  puts "Dealer's hand:"
  puts deal.to_s
else
  until play.hand_value > 21
    play.switch_ace
    puts "Do you want to hit(h) or stay(s)?"
    action = $stdin.gets.chomp
    if action == "h"
      puts "You chose to hit, here's your new hand"
      play.hit
      puts play.to_s
    else
      puts "You chose to stay, here's your final hand"
      puts play.to_s
      break
    end
  end

  puts "Dealer's hand:"
  puts deal.to_s

  while deal.hand_value < 17
    deal.hit
    puts deal.to_s
  end

  if play.hand_value <= 21
    if play.hand_value > deal.hand_value
      puts "Player wins"
    elsif play.hand_value == deal.hand_value
      puts "Dealer and Player tied"
    else
      puts "Dealer wins"
    end
  else
    puts "Player busts. Dealer wins"
  end
end

puts "There are #{$d.remaining} cards in the deck"
