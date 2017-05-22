# class Card
#  # Getter and Setter methods for rank, suit and color
#  attr_accessor :rank, :suit, :color
#  # Gets called when you call the new method to create an instance
#  # card = Card.new('10', 'K', 'Black')
#  def initialize(rank, suit, color)
#    @rank = rank
#    @suit = suit
#    @color = color
#  end
# end

class Card
<<<<<<< HEAD
 # Getter and Setter methods for rank, suit
 attr_accessor :rank, :suit
 # Gets called when you call the new method to create an instance
 # card = Card.new(10, 'Heart')
 def initialize(rank, suit)
   @rank = rank
   @suit = suit
 end
end
=======
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
>>>>>>> updatess
