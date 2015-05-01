require('rspec')
require('word')
require('definition')

describe(Word) do

  describe(:initialize) do
    it("will initialize a new word with an empty list of definitions") do
      test_word = Word.new("puissance")
      expect(test_word.word).to(eq("puissance"))
      expect(test_word.definitions).to(eq([]))
    end
  end

  describe(:add_definition) do
    it("will add a definition to a word's list of definitions") do
      test_word = Word.new("puissance")
      test_definition = Definition.new("Great power, influence, or prowess.")
      test_word.add_definition(test_definition)
      expect(test_word.definitions).to(eq([test_definition]))
    end
  end

end
