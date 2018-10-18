#this bot tweeter should retrieve tweet handles from Google spreadsheet Then send Tweet and favs

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
end

Bottwitter.new.research
