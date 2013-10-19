# 05: Silly Blocks

def reverser
  yield.split(" ").map {|word| word.reverse}.join(" ")
end

def adder(num_to_add = 1)
  yield+num_to_add
end

def repeater(num_repeats = 1)
  num_repeats.times {yield}
end
