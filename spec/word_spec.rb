require('rspec')
require('word')

describe(Word) do

  describe(:initialize) do
    it("will intialize a new word with an empty list of definitions") do
      test_word = Word.new("puissance")
      expect(test_word.word).to(eq("puissance"))
      expect(test_word.definitions).to(eq([]))
    end
  end

end
