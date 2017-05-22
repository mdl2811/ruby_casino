require 'pry'
Suits = %w[ Clubs Hearts Spades Diamonds ]
Ranks = %w[ 1 2 3 4 5 6 7 8 9 10 11 12 13 ]
$d = []

class Card
  include Enumerable
    @@suit_value = Hash[ Suits.each_with_index.to_a ]
    @@rank_value = Hash[ Ranks.each_with_index.to_a ]

    attr_reader :rank, :suit
    attr_accessor :value

    def initialize(rank, suit)
        @rank = rank
        @suit = suit
    end

    def value
      value = case @rank.to_i
        when 1
          11
        when 2..10
          @rank
        when 11..13
          10
        else
          nil
      end
    end

    def display_rank
      case @rank
        when "11"
          "Jack"
        when "12"
          "Queen"
        when "13"
          "King"
        when "1"
          "Ace"
        else
          @rank
        end
    end

    def to_s
      "#{display_rank} of #{@suit}, value #{value}"
    end

end

class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    Suits.each do |suit|
      Ranks.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end
  def shuffle!
    @cards.shuffle!
  end
  def draw
    @cards.pop
  end
  def remaining
    @cards.length
  end
end

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
