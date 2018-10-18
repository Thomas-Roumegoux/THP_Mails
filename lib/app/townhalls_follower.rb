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
   def research # cherche les IDs des mairies des villes
       tweeter_Ids = []
       client_connect
       i = 0
       tab_mairie = ["Mairie Vincennes","Mairie Créteil","Mairie Suresnes"]
       tab_mairie.each do |mairie|
           @client.user_search(mairie).take(6).each do |tweet| #en dur pour le moment , sinon un tableau
               #tweeter_Ids[i] = "#{tweet.id}"

               puts "#{tweet.id} ; #{tweet.screen_name}; #{tweet.lang}; #{tweet.location}; #{tweet.created_at}; #{tweet.followers_count} "
               #puts "#{tweet.user.id}; #{tweet.user.screen_name}; #{tweet.user.email}; #{tweet.user.followers_count}; #{tweet.user.name}"
               #puts tweet.user.methods
               i+= 1
           end
           puts
       end
       #test



   end

   #cherche Handle mairies des villes
   def send_Handle

   end
end

#Cette classe est en charge de creer un Handle pour chaque mairie
#Le programme travail un meme fichier CSV, en entree et sortie
# utilise la classe Bottwitter
class Handle
   require "csv"
   tweet_research = ["Mairie Vincennes"]

   @rows = []  #me servira memoire tampon pour les lignes
   @row_handle = [] #recupere mes lignes avec mes Handle

   def get_rows_from_csv
       CSV.foreach("file.csv") do |row|
           p row
       end
   end

   def tweet
       puts Bottwitter.new.research
   end

end
start = Handle.new
start.tweet
