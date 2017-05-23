require 'pry'

require_relative 'player'

class HeadsTails

	def initialize(player)
		puts 'Welcome to Heads Tails!'
		# puts "#{player.name}, you have a balance of #{player.wallet.amount}"
		puts 'how much do you want to bet?'
		  amount = gets.strip.to_i

    check_result(player, amount)
	end

	def check_result(player, amount)
		heads_tails = rand(1) == 0 ? 'heads' : 'tails'
		puts 'Pick (1) for heads and (2) for tails.'
		user_input = gets.strip.to_i
		case user_input
		when 1
			if heads_tails == 'heads'
				puts "you win"
				player.wallet.amount += amount * 2
			else
				heads_tails != 'heads'
				puts "you lose"
				player.wallet.amount -= amount
			end
		when 2
			puts 'tails'
			 if heads_tails == 'tails'
				 puts "you win"
				 player.wallet.amount += amount * 2
		   else
				 heads_tails != 'heads'
				 puts "you lose"
				 player.wallet.amount -= amount
			 end
		else 'Please pick (1) or (2) for heads and tails.'
		end

	end

end
