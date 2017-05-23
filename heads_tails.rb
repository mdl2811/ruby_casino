require 'pry'

require_relative 'player'

class HeadsTails

	def initialize(player)
		puts 'Welcome to Heads Tails!'
		puts "#{player.name}, you have a balance of #{player.wallet.amount}"
		puts 'How much do you want to bet?'
		  amount = gets.strip.to_i

    check_result(player, amount)
		continue_quit(player)
	end

	def check_result(player, amount)
		heads_tails = rand(2) == 0 ? 'Heads' : 'Tails'
		puts 'Pick (1) for heads and (2) for tails.'
		user_input = gets.strip.to_i
		case user_input
		when 1
      puts 'Heads'
			if heads_tails == 'Heads'
        puts "You win!"
				player.wallet.amount += amount * 2
			else
				puts 'Tails!'
				puts "You lose!"
				player.wallet.amount -= amount
			end
		when 2
			puts 'Tails'
			 if heads_tails == 'Tails'
				 puts "You win!"
				 player.wallet.amount += amount * 2
		   else
				 puts 'Heads!'
				 puts "You lose!"
				 player.wallet.amount -= amount
			 end
		else 'Please pick (1) or (2) for heads and tails.'
		end
	end

	def continue_quit(player)
		puts "Would you like to continue?
		1) yes
		2) no"
		continue = gets.strip.to_i
  case continue
	when 1
		puts 'Continue'
		HeadsTails.new(player)
	when 2
		puts 'Bye, come play again.'
	end
end


end
