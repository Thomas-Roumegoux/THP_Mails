require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'dotenv'
require 'csv'
require 'bundler'

def send_one_mail(address_mail, nom_mairie, number_commune)
	gmail = Gmail.connect!("anais.chevalier928@gmail.com","THPtest123")
	gmail.deliver do
	  to address_mail
	  subject "Bonjour! Vous avez entendu The Hacking Project? "
	   html_part do
	   	content_type 'text/html; charset=UTF-8'
		body "
		<p>Bonjour,</p> 
		<p>
		Je m'appelle Anais, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous. 
		</p>
		<p>
		Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{nom_mairie}, #{number_commune} veut changer le monde avec nous ? 
		</p>
		<p>
		Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80
		</p>
		</body>
		"
	  end
	end
end

CSV.foreach("db/townhalls.csv") do |row|
	send_one_mail(row[0], row[1], row[2])
end
