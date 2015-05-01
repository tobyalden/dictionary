require('rspec')
require('dictionary')

describe(Dictionary) do

  before() do
    Dictionary.clear()
  end

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

  describe(:save, :load) do
    it("will save and load an instance of a dictionary to and from the class itself") do
      test_dictionary = Dictionary.new()
      test_dictionary.save()
      expect(Dictionary.load()).to(eq(test_dictionary))
    end
  end

  describe(:get_word) do
    it ("will return a specific word object from a dictionary's list of words given the corresponding string") do
      test_dictionary = Dictionary.new()
      test_word = Word.new("puissance")
      test_word2 = Word.new("dentate")
      test_dictionary.add_word(test_word)
      test_dictionary.add_word(test_word2)
      expect(test_dictionary.get_word("puissance")).to(eq(test_word))
      expect(test_dictionary.get_word("dentate")).to(eq(test_word2))
    end
  end

end
