require 'nokogiri'
require 'open-uri'


# choper les mails pour chaque mairie
def get_emails(url)
	page = Nokogiri::HTML(URI.open(url))
	scrap = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
	scrap.each do |node| return "" + node.text
	end
end


# choper les nom des mairies et bien présenter
def scrap_mairies(url)
	h = {}
	page = Nokogiri::HTML(URI.open(url))
	scrap = page.xpath('//a[@class="lientxt"]')
	scrap.each do |node|
		city = node.text.split.each do |text| text.capitalize!
		end
		city = "" + city * "-"
		url = 'http://annuaire-des-mairies.com/' + node['href'].slice!(1..-1)
		
		email = get_emails(url)
		
		h.store(city,email)
	end
#stocker tout ça dans un fichier texte
	filename = "mairie_christmas.txt"
	file = File.open(filename,"w")
	file.puts h
	file.close
    puts "Le fichier texte est prêt"
end

scrap_mairies('http://annuaire-des-mairies.com/val-d-oise.html')