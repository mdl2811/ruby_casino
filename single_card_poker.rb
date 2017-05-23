require_relative 'Deck'
require_relative 'Card'

class SingleCardPoker
 # Getter and Setter methods
 # attr_accessor 

 # Gets called when you call the new method to create an instance
 # deck = Deck.new
 def initialize(player)

 	players = []
 		
 	puts "Hi, #{player.name}! Let's play Single Card Poker!"
	num_players = get_num('preferred number of players', 0)

   continue = true
   	# create a deck and shuffle it
   	$d = Deck.new
   	$d.shuffle!
   	puts "A new deck has been shuffled and there are #{$d.remaining} cards. \n"

   while continue

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
         num_losses = 0

      	# win or lose!
      	puts "\n\nYour card is:  "
      	print_card(players[0])

      	for i in 1..num_players
      		# check if card rank less than others
      		if players[0].rank.to_i < players[i].rank.to_i
      			num_losses = num_losses + 1

      		# if ranks are the same, check which suit is higher
      		elsif players[0].rank.to_i == players[i].rank.to_i
      			if players[0].suit < players[i].suit
      				num_losses = num_losses + 1

      			elsif players[0].suit > players[i].suit
      				num_wins = num_wins + 1
      			end
      		else 
      			# rank must be higher
      			num_wins = num_wins + 1
      		end
      	end

         puts "Your card beats #{num_wins} of the other other players' cards."
         puts "Your card loses to #{num_losses} of the other other players' cards."

         bank = num_wins - num_losses
         # change wallet by amount won or lost
      	if bank < 0
      		puts "You lose a total of $#{bet * bank}"
      		player.wallet.remove_money(bet * bank.abs)
      	elsif bank > 0
      		puts "You win a total of $#{bet * bank}"
      		player.wallet.add_money(bet * bank)
      	else
      		puts "You didn't win money, but you didn't lose money either!"
      	end

     puts "\n\n\nDo you want to play again? Y or N"
     check = gets.strip
      until (check.downcase == 'y') || (check.downcase == 'n')
         puts "\nINVALID ENTRY. Try again."
         check = gets.strip
      end
      if (check == 'n')
         continue = false
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
end