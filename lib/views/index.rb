class Index
	
	def initialize
	puts "Bonjour, quel est ton nom?"
	@name = gets.chomp
	return @name
	end
	def go
	puts "Bonjour #{@name.capitalize} nous allons lancer la recherche d'adresse mail"
	end
end

@new_user = 0
@new_user = Index.new.go

