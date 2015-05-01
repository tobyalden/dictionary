require('rspec')
require('dictionary')

describe(Dictionary) do

  describe(:initialize) do
    it("will initialize a new dictionary with an empty list of words") do
      test_dictionary = Dictionary.new()
      expect(test_dictionary.words).to(eq([]))
    end
  end

  describe(:add_word) do
    it("will add a word to a dictionary's list of words") do
      test_dictionary = Dictionary.new()
      test_word = Word.new("puissance")
      test_dictionary.add_word(test_word)
      expect(test_dictionary.words).to(eq([test_word]))
    end
  end

end
