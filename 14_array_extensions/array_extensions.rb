# 14: Array Extensions

class Array
  def sum
    return 0 if self.length == 0
    self.reduce(:+)
  end

  def square
    return [] if self.length == 0
    self.map {|x| x**2}
  end

  def square!
    return [] if self.length == 0
    self.map! {|x| x**2}
  end
end