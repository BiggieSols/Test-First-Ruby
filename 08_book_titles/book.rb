# 08: Book Titles

class Book
  attr_reader :title

  def title=(title_str)
    exceptions = %w(a an the and or in of)
    title_arr = title_str.split(" ")
    capitalized_arr = title_arr.each_with_index.map do |word, index|
      [0, title_arr.length].include?(index) || !exceptions.include?(word) ? word.capitalize : word
    end
    @title = capitalized_arr.join(" ")
  end
end