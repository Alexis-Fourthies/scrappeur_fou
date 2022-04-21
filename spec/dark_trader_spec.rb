require_relative '../lib/dark_trader'

describe "fusiontab" do
    it "should return a hash" do
        expect(fusiontab(["a","b"],["c","d"])).to be_a(Hash)
    end
end

describe "scrap_cryptos" do
    it "should return a hash" do
        expect(scrap_cryptos(scrapper)).to be_a(Hash)
    end
end

describe "fichiertxt" do
    it "should create a file" do
        fichiertxt(scrap_cryptos(scrapper))
        expect(File.exist?("dark_trader.txt")).to be(true)
    end
end