require_relative 'deck'
require_relative 'card'

class Indian_Poker
 # Getter and Setter methods
 # attr_accessor 

 # Gets called when you call the new method to create an instance
 # deck = Deck.new
 def initialize(player)

 	players = []
 		
 	puts "Hi, #{player.name}! Let's play Indian Poker!"
	num_players = get_num('preferred number of players', 0)

	# create a deck and shuffle it
	$d = Deck.new
	$d.shuffle!
	puts "A new deck has been shuffled and there are #{$d.remaining} cards"

	# get a card for each player
   	for i in 0..num_players
   		players[i] = $d.draw
   	end

   	# show all other players cards (not casino player)
   	puts "Here are the other players' cards:"
   	for i in 1..num_players
   		puts "Player #{i}:"
   		puts "  #{print_card(players[i])}"
   	end

   	# get bet
  	bet = get_num('bet', 0)

	# number of cards the player beats
   	num_wins = 0 

   	# win or lose!
   	puts "\n\nYour card is:  "
   	print_card(players[0])

   	for i in 1..num_players
   		# check if card number less than others
   		if players[0].rank.to_i < players[i].rank.to_i
   			num_wins = num_wins - 1
   			puts "lost by rank, num_wins is #{num_wins}"

   		# if numbers are the same, check which suit is higher
   		elsif players[0].rank.to_i == players[i].rank.to_i
   			if players[0].suit < players[i].suit
   				num_wins = num_wins - 1
   			puts "lost by suit, num_wins is #{num_wins}"
   			elsif players[0].suit > players[i].suit
   				num_wins = num_wins + 1
   				puts "win by suit, num_wins is #{num_wins}"
   			end
   		else 
   			# number must be higher
   			num_wins = num_wins + 1
   			puts "win by rank, num_wins is #{num_wins}"
   		end
   	end

   	if num_wins < 0
   		puts "Your card beats #{num_players + num_wins} of the other other players' cards."
   		puts "You lose a total of $#{bet * num_wins.abs}"
   		player.wallet.remove_money(num_wins * num_wins.abs)
   	elsif num_wins > 0
   		puts "Your card beats #{num_wins} of the other other players' cards."
   		puts "You win a total of $#{bet * num_wins}"
   		player.wallet.add_money(bet * num_wins)
   	else
   		puts "You didn't win money, but you didn't lose money either!"
   	end
  end
end


# an instance of card gets passed to this method
def print_card(card)
	case card.rank
	when '11'
		puts "   Jack of #{card.suit}"
	when '12'
		puts "   Queen of #{card.suit}"
	when '13'
		puts "   King of #{card.suit}"
	when '1'
		puts "   Ace of #{card.suit}"
	else
		puts "   #{card.rank} of #{card.suit}"
   	end
end