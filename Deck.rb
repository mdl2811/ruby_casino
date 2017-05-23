@d = []

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
    sound = Sounder::Sound.new "./media/262812__win88emily__card-shuffle-win88.mp3"
    sound.play
    @cards.shuffle!
  end
  def draw
    sound = Sounder::Sound.new "./media/240777__f4ngy__dealing-card.wav"
    sound.play
    @cards.pop
  end
  def remaining
    @cards.length
  end
end
