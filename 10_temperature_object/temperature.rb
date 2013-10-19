# 10: Temperature

class Temperature
  attr_accessor :in_fahrenheit, :in_celsius

  def initialize(args)
    if args.keys.include?(:f)
      @in_fahrenheit = args[:f]
      @in_celsius = ftoc(@in_fahrenheit)
    elsif args.keys.include?(:c)
      @in_celsius = args[:c]
      @in_fahrenheit = ctof(@in_celsius)
    else
      raise ArgumentError.new("initialization parameters need to include either celsius or fahrenheit")
    end
  end

  def self.from_celsius(celsius)
    Temperature.new(:c=>celsius)
  end

  def self.from_fahrenheit(fahrenheit)
    Temperature.new(:f=>fahrenheit)
  end

  private
  def ftoc(fahrenheit)
    (fahrenheit-32)*(5.0/9.0)
  end

  def ctof(celsius)
    celsius*(9.0/5.0)+32
  end
end

class Celsius < Temperature
  def initialize(celsius)
    super(:c=>celsius)
  end
end

class Fahrenheit < Temperature
  def initialize(fahrenheit)
    super(:f=>fahrenheit)
  end
end