# 12: RPN Calculator

class RPNCalculator
  attr_reader :value

  def initialize
    @num_stack = []
    @value = nil # this will be set once an operation is performed. my style seems funny here, what's the best way to do it?
  end

  def push(val)
    @num_stack.push(val)
  end

  def plus
    operate(:+)
  end

  def times
    operate(:*)
  end

  def minus
    operate(:-)
  end

  def divide
    operate(:/)
  end

  def tokens(str)
    tokens = %w(* + - /)
    str.split(' ').map {|x| tokens.include?(x) ? x.to_sym : x.to_f}
  end

  def evaluate(str)
    # find the pattern in the string that matches num num operator
    str_to_eval = str.match /(-?[0-9]\.?[0-9]*) (-?[0-9]\.?[0-9]*) ([+-\/*])/
    
    # from the results of the regex, calculate the value and sub into the equation string
    val = $1.to_f.send($3.to_sym, $2.to_f)
    str.gsub!(str_to_eval.to_s, val.to_s)

    # if there are more expressions to evaluate, do some recursion. otherwise output the result
    str.split(" ").length > 1 ? evaluate(str) : str.to_f
  end

  private

  def pop_nums
    # confirms that there are at least 2 numbers to perform an operation on
    raise "calculator is empty" if @num_stack.length < 2

    val_1 = @num_stack.pop
    val_2 = @num_stack.pop
    [val_1, val_2]
  end

  def operate(operator)
    vals = pop_nums
    @value = vals[1].to_f.send(operator, vals[0].to_f)
    @num_stack.push(@value)
  end
end