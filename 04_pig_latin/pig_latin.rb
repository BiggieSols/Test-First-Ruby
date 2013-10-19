# 04: Pig Latin

def get_pig_latin(word)
  pig_latin_syllable = "ay"

  # regex, how cool! is there a better way to do this?
  m = word.match /([bcdfghjklmnpqrstvwxyz|qu]*)(\w*)/
  pig_latin_word = $2+$1+pig_latin_syllable
end

def translate(str)
  str.split(" ").map {|word| get_pig_latin(word)}.join(" ")
end