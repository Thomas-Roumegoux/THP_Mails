require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'bundler'
Bundler.require

class Scrapper
    
    include Enumerable
    
    attr_accessor :departement, :villes, :email, :link
    
    def initialize
        
        @departement = []
        @villes = []
        @email = []
        @link = []
        
    end
    
    #récupère numéro et noms de département
    
    def get_name
        
        puts "lance la methode get name qui sert a recup le nom et le lien des departements"
        
        page = Nokogiri::HTML(open("http://annuaire-des-mairies.com"))
        page.css("/html/body/div/main/section[2]/div/table/tbody/tr[20]/td[4]/a").each do |node|
            @departement << node.text
            @link<< node['href']
        end
        page.css("/html/body/div/main/section[2]/div/table/tbody/tr[16]/td[4]/a").each do |node|
            @departement << node.text
            @link<< node['href']
        end
        page.css("/html/body/div/main/section[2]/div/table/tbody/tr[24]/td[2]/a").each do |node|
            @departement << node.text
            @link<< node['href']
        end
        
        puts "on lance la methode get the email pour recup chaque email de chaque commune"
        
    end
    
    #récupère noms des villes et emails
    
    def get_all_url
        
        puts "lance get all url qui lance get name"
        
        get_name
        
        
        @link.each do |x|
            
            page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{x}"))
            page.css("a.lientxt").each do |node|
                
                @hypertext= [(node['href'].slice!(1..-1))]
                @villes << node.text
                
                
                
                def get_the_email
                
                page = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{@hypertext[0]}"))
                @email<< page.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
                
            end
            
            get_the_email
            
        end
    end
end
end

scrap = Scrapper.new

puts "lance get all url qui lance get all name et va recup les urls des communes"

scrap.get_all_url

puts scrap.departement

puts scrap.villes

puts scrap.email

puts scrap.link

@mix = Hash[scrap.villes.zip(scrap.email)]

File.open(‘db/hannan.json’, ‘w’) do |f|
    f.write(@mix.to_json )
end



