# method to ensure a string is entered
# input variables are strings
#     type is the name of the variable that needs to be set, as a string
#     var is the variable itself
# returns the input as a string
def get_string(type, var)
	while (var == nil) || (var == '') do
		puts "What is your #{type}?"
		var = gets.strip
		if var == '' 
			puts "You must enter a valid #{type}." 
		end
	end
	var
end

# method to ensure an integer >= 1 is entered
# input variable 'type' is the name of the variable that needs to be set, as a string
#     var is the variable itself as a float or integer
# returns the input as an integer
def get_num(type, var)
	while (var == nil) || (var <= 0) do
		puts "What is your #{type}?"
		var = gets.strip.to_i
		if var < 0
			puts "You must enter a valid #{type}." 
		end
	end
	var
end

