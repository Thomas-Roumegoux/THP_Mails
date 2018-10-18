class Index
	
	def initialize
	puts "Bonjour quel est ton nom?"
	@name = gets.chomp
	return @name
	end
	def go
	puts "Bonjour #{@name.capitalize} que veux tu faire ?"
	end
end

new_user = Index.new.go

