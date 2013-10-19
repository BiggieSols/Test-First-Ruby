# 03: Simon Says

def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(str, num_repeats=2)
  ("#{str} " * num_repeats)[0..-2]
end

def start_of_word(word, num_chars)
  word[0..num_chars-1]
end

def first_word(str)
  str.split(" ")[0]
end

def titleize(str)
  minor_words = %w(a an the it and or of over)
  titleized_str = []
  str.split(" ").each_with_index do |word, index|
    updated_word = index == 0 || !minor_words.include?(word) ? word.capitalize : word
    titleized_str.push(updated_word)
  end
  titleized_str.join(" ")
end