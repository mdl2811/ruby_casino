require_relative 'card'

class Indian_Poker
 # Getter and Setter methods
 # attr_accessor 

 # Gets called when you call the new method to create an instance
 # deck = Deck.new
 def initialize(player)

 	players = []
 		
 	puts "Let's play Indian Poker!"
	num_players = get_num('preferred number of players', 0)

	# create a card for each player
   	for i in 0..num_players
   		players[i] = get_card
   	end

   	# show all other players cards (not casino player)
   	puts "Here are the other players' cards:"
   	for i in 1..num_players
   		$STDOUT.print "Player #{i}:  "
   		print_card(players[i])
   		@STDOUT.flush
   	end

   	# get bet
	puts "\n\nHow much do you want to bet?"
   	bet = get_num('bet', 0)

	# number of cards the player beats
   	num_wins = 0 

   	# win or lose!
   	@STDOUT.print "\n\nYour card is:  "
   	print_card(player[0])
   	@STDOUT.flush

   	for i in 1..num_players
   		if player[0].card.rank < player[i].card.rank
   			num_wins = num_wins - 1
   		elsif player[0].card.rank = player[i].card.rank
   			if player[0].card.suit < player[i].card.suit
   				num_wins = num_wins -1
   			elsif player[0].card.suit > player[i].card.suit
   				num_wins = num_wins + 1
   			end
   		else 
   			num_wins = num_wins + 1
   		end
   	end

   	puts "Your card beats #{num_wins} of the other other players' cards."
   	if num_wins < 0
   		puts "You lose $#{bet * num_wins.abs}"
   		player.wallet.remove_money(num_wins * num_wins.abs)
   	elsif num_wins > 0
   		puts "You win $#{bet * num_wins}"
   		player.wallet.add_money(bet * num_wins)
   	else
   		puts "You didn't win, but you didn't lose either!"
   	end
  end
end

def get_card
	card.new(rand(1..13), ['Heart', 'Diamond','Spade', 'Club'].sample)
end

# an instance of card gets passed to this method
def print_card(card)
	case card.rank
	when 11
		$STDOUT.print "Jack of #{card.suit}"
	when 12
		$STDOUT.print "Queen of #{card.suit}"
	when 13
		$STDOUT.print "King of #{card.suit}"
	when 1
		$STDOUT.print "Ace of #{card.suit}"
	else
		$STDOUT.print "#{card.rank} of #{card.suit}"
   	end
end