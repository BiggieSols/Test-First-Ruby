# 07: Hello Friend

class Friend
	attr_reader :name

	def initialize(name="Buster")
		@name = name
	end

	def greeting(person_to_greet="")
		if person_to_greet == ""
			"Hello!"
		else
			"Hello, #{person_to_greet}!"
		end
	end
end