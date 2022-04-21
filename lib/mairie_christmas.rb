require 'nokogiri'
require 'open-uri'


# choper les mails pour chaque mairie
def get_emails(url)
	page = Nokogiri::HTML(URI.open(url))
	scrap = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
	scrap.each do |node| return "Mail:" + node.text
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
		city = "Ville: " + city * "-"
		url = 'http://annuaire-des-mairies.com' + node['href'].slice!(1..-1)
		
		mail = get_emails(url)
		
		h.store(city,mail)
	end
#stocker tout ça dans un fichier texte
	fname = "mairie_christmas.txt"
	somefile = File.open(fname,"w")
	somefile.puts h
	somefile.close
    puts "Le fichier texte est prêt"
end

scrap_mairies('http://annuaire-des-mairies.com/val-d-oise.html')