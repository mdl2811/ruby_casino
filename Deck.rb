# class Deck
#  # Getter and Setter methods for rank, suit and color
#  attr_accessor :cards
#
#  # Gets called when you call the new method to create an instance
#  # deck = Deck.new
#  def initialize
#    @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
#    @suits = %w(Spades Diamonds Clubs Hearts)
#    @cards = []
#    generate_deck
#  end
#
#  def shuffle_cards
#   @cards.shuffle
#  end
#
#  def generate_deck
#    @suits.each do |suit|
#      @ranks.size.times do |i|
#        # Ternary Operator
#        color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red'
#        @cards << Card.new(@ranks[i], suit, color)
#      end
#    end
#  end
# end
Suits = %w[ Clubs Hearts Spades Diamonds ]
Ranks = %w[ 1 2 3 4 5 6 7 8 9 10 11 12 13 ]
$d = []

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
