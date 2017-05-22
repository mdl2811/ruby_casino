require 'pry'

class HeadsTails

	def initialize(player)
		puts 'Welcome to Heads Tails!'
		# puts "#{player.name}, you have a balance of #{player.wallet.amount}"
		puts 'how much do you want to bet?'
		  amount = gets.strip.to_i
    heads_tails = rand(1) == 0 ? 'heads' : 'tails'
		puts 'Pick (1) for heads and (2) for tails.'
    check_result
	end

	def check_result
		user_input = gets.strip.to_i
		case user_input
		when 1
			puts 'heads'
			if head_tails == 'heads'
				puts "you win"
				player.wallet.amount += amount * 2
			else
				player.wallet.amount -= amount
			end
		when 2
			puts 'tails'
			 if head_tails == 'tails'
				 puts "you win"
				 player.wallet.amount += amount * 2
			rand(1)
		   else
				 player.wallet.amount -= amount
			 end
		else 'Please pick (1) or (2) for heads and tails.'
		end
	end

end

