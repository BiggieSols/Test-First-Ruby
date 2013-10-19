# 09: Timer

class Timer
  attr_accessor :seconds

  def initialize 
    @seconds = 0
  end

  def time_string
    secs = @seconds%60
    mins = (@seconds % (60**2) - secs)/60
    hours = (@seconds % (60**3) - mins - secs)/60**2
    "#{padded(hours)}:#{padded(mins)}:#{padded(secs)}"
  end

  def padded(num)
    num < 10 ? "0#{num}" : "#{num}"
  end
end