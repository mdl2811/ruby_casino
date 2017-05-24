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
    puts "Wait just a sec while the deck is shuffled!"
    sound = Sounder::Sound.new "./262812__win88emily__card-shuffle-win88.mp3"
    sound.play
    sleep(5)
    @cards.shuffle!
  end
  def draw
    sound = Sounder::Sound.new "./240777__f4ngy__dealing-card.wav"
    sound.play
    @cards.pop
  end
  def remaining
    @cards.length
  end
end
