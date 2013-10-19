# 15: In Words

module WordConversions
  def in_words
    # Greater_than_thousands_exponents = {3=>'thousand', 6=>'million', 9=>'billion', 12=>'trillion'}
    greater_than_thousands_exponents = {3=>'', 6=>'thousand', 9=>'million', 12=>'billion', 15=>'trillion'}
    less_than_thousands_exponents = [1,2,3]

    places_hash_2 = get_places_hash(self, greater_than_thousands_exponents.keys,3)

    value_str = ""

    places_hash_2.sort.reverse.each do |vals|
      place = greater_than_thousands_exponents[vals[0]]
      triple_digit_text = triple_digit_breakdown(get_places_hash(vals[1], less_than_thousands_exponents, 1))
      value_str += triple_digit_text != "" ? "#{triple_digit_text} #{place} " : ""
    end

    # Spacing gets tricky, just applying a fix here to make sure any multiple-whitespaces are converted to single spaces
    value_str == "" ? "zero" : value_str.rstrip.gsub(/\s+/, " ")
  end

  private

  # Returns a hash corresponding to the number we're evaluating. Gives exponent val and hundreds in Hash format 
  # This is used both to get thousands/millions/etc. and also ones, tens, hundreds
  # Could I use separate functions for this? probably, but seems nicer to just have one
  # takes "3" for the exponent modifier to convert to thousands/millions/etc. takes "1" for hundreds
  def get_places_hash(num, exponents_arr, exponent_modifier)
    places_hash = {}
    exponents_arr.each do |x|
      val = (num % 10**x)/(10**(x-exponent_modifier))
      places_hash[x]=val
    end
    places_hash
  end

  # Converts a 3-digit number to text
  def triple_digit_breakdown(digits_hash)
    base_nums = {0=>'', 1=>'one', 2=>'two', 3=>'three', 4=>'four', 5=>'five', 6=>'six', 7=>'seven', 8=>'eight', 9=>'nine'}
    ten_to_nineteen = {10=>'ten', 11=>'eleven', 12=>'twelve', 13=>'thirteen', 14=>'fourteen', 15=>'fifteen', 16=>'sixteen', 17=>'seventeen', 18=>'eighteen', 19=>'nineteen'}
    multiples_of_ten = {0=>'', 2=>'twenty ', 3=>'thirty ', 4=>'forty ', 5=>'fifty ', 6=>'sixty ', 7=>'seventy ', 8=>'eighty ', 9=>'ninety '}

    ones = digits_hash[1]
    tens = digits_hash[2]
    hundreds = digits_hash[3]

    val_str = hundreds > 0 ? "#{base_nums[hundreds]} hundred " : ""
    val_str += tens == 1 ? ten_to_nineteen[(tens*10)+ones] : multiples_of_ten[tens] + base_nums[ones]
  end

end

class Fixnum
  include WordConversions
end