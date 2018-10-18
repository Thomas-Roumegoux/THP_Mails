
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
    def research # cherche Handle mairies des villes
        tweeter_Ids = []
        client_connect
        i = 0
        @client.search("Mairie Vincennes").take(3).each do |tweet| 
            tweeter_Ids[i] = "#{tweet.id}"
            i+= 1
        end
        puts tweeter_Ids
    end

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
#start.display
start.tweet
