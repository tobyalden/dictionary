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
      # because we run gsub in add_description, the definitions' object IDs are no longer identical, and so we must check their contents against each other rather than simply checking that they are the same
      expect(test_word.definitions[0].definition).to(eq(test_definition.definition))
    end
  end

end
