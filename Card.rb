class Card
 # Getter and Setter methods for rank, suit
 attr_accessor :rank, :suit
 # Gets called when you call the new method to create an instance
 # card = Card.new(10, 'Heart')
 def initialize(rank, suit)
   @rank = rank
   @suit = suit
 end
end