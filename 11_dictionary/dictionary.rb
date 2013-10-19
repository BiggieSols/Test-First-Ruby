# 11: Dictionary

class Dictionary
	attr_accessor :entries, :keywords

  def initialize
    @entries = {}
    @keywords = []
  end

  def add(entry)
    case entry
    when Hash
      @entries.merge!(entry)
    when String
      @entries[entry] = nil
    when Array
      entry.each {@entries[entry] = nil}
    end
  	update_keywords
  end

  def include?(keyword)
  	@keywords.include?(keyword)
  end

  def find(key)
  	matched_output = {}
  	@keywords.join(" ").scan(/#{key}\S*/i) {|matched_word| matched_output[matched_word] = @entries[matched_word] or nil}
  	matched_output
  end

  def printable
    output_str = ""
    @keywords.each {|k| output_str+= "[#{k}] \"#{entries[k]}\"\n"}
    output_str[0..-2]
	end

  private

  def update_keywords
  	@keywords = @entries.keys.sort
  end
end