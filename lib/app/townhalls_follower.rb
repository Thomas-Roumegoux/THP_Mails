#Se connecte a tweeter
#Recherche les handle lié aux mairie et les renvoie
class Bottwitter
   require 'twitter'
   require 'dotenv'
   require 'pry'

   Dotenv.load

   def client_connect
       @client = Twitter::REST::Client.new do |config|
           config.consumer_key        = ENV["TWITTER_API_KEY"]
           config.consumer_secret     = ENV["TWITTER_API_SECRET"]
           config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
           config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
       end
       return @client
   end
   def research #Cherche les screen_name des auteurs de tweets obtenus par recherche sur "Mairie VILLE" Puis pour de chaque villes, en deduit le handle
       tweeter_Ids = []
       client_connect
       handles = []
       i = 0
       get_cities.each do |mairie|
           @client.user_search(mairie).take(1).each do |tweet| # retient le 1er resultat de la recherche,

               handles[i] = "@#{tweet.screen_name}"  #retourne le Handle
               puts handles[i]
               tweeter_Ids[i] = tweet.id
               i+= 1
           end
           puts
           #@client.follow(tweeter_Ids[i])
       end


   end

   #cherche les noms des villes
   def get_cities
       start = City.new

       return start.get_name
   end
end

#Cette classe est en charge de creer un Handle pour chaque mairie
#Le programme travail un meme fichier CSV, en entree et sortie
# utilise la classe Bottwitter
class City
   require "csv"

   #Renvoie un Array de nom_de_ville
   def get_name
       i = 0
       cities = []
       rows = []
       CSV.foreach("db/townhalls.csv") do |row|
           cities[i] = row[0].gsub(/[\t]/,'')
           i += 1
       end

       return cities

   end

end
Bottwitter.new.research
