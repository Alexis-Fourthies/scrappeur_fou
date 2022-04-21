require 'nokogiri'
require 'open-uri'

# site à scrapper

def scrapper
    return doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
end

# array pour stocker les noms et prix des cryptos
def fusiontab(tab1,tab2)
    return Hash[tab1.zip(tab2)]
end

# chopper noms et valeurs des cryptos
def scrap_cryptos(page)
    array_name=[]
    array_value=[]
    name_of_crypto=page.xpath('/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[*]/td[3]/div')
    value_of_crypto=page.xpath('/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[*]/td[5]/div/a/span')
    hash={}
    name_of_crypto.each{ |name|
        array_name<<name.text
    }
    value_of_crypto.each{|price|
    array_value << price.text
    }
    hash=fusiontab(array_name,array_value)
    return hash
end

#stocker tout ça dans un fichier texte

def fichiertxt(hash)
    fname = "dark_trader.txt"
    somefile = File.open(fname, "w")
    somefile.puts hash
    somefile.close
    puts "Le fichier texte est prêt"
end

puts scrap_cryptos(scrapper)
fichiertxt(scrap_cryptos(scrapper))
