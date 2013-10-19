
def calc(equation)
	return equation unless equation.match /[-+*\/]/
	# puts equation
	m = equation.match /(\d+) (\d+) ([-+*\/])/
	value = $1.to_i.send($3, $2.to_i)
	new_equation = equation.gsub(m.to_s, value.to_s)
	calc(new_equation)
end

equation1 = '1 2 + 3 /'
equation2 = '1 2 3 4 * + + '
puts calc(equation2)

# def evaluate(string)
#   #return string.to_i unless string.include?(' ')
#   string.match /(-?\d+) (-?\d+) ([-+*\/])(?!\d)/
#   puts $1
#   puts $2
#   puts $3

#   #result = ($1.to_i).send($3,$2.to_i)

#   #string.gsub!($1 + ' ' + $2 + ' ' + $3, result.to_s)
#   #evaluate(string)
# end

# evaluate("1 2 3 4 + * -")