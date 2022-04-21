require_relative '../lib/mairie_christmas'

describe "get_emails" do
    it "should return a string" do
        expect(get_emails("http://annuaire-des-mairies.com/95/avernes.html")).to be_a(String)
    end
end
describe "scrap_mairies" do
    it "should return a hash" do
        expect(scrap_mairies("http://annuaire-des-mairies.com/val-d-oise.html")).to be_a(Hash)
    end
end

describe "fichiertxt" do
    it "should create a file" do
        expect(File.exist?("mairie_christmas.txt")).to be(true)
    end
end