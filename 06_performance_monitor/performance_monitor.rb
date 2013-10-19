# 06: Performance Monitor

def measure(num_repeats = 1)
  start_time = Time.now
  num_repeats.times {yield}
  end_time = Time.now
  avg_time = (end_time - start_time)/num_repeats
end